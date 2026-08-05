package dev.orbitalpack.deathbeam;

import io.papermc.paper.event.player.PlayerStopUsingItemEvent;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.bukkit.FluidCollisionMode;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.Particle;
import org.bukkit.World;
import org.bukkit.damage.DamageSource;
import org.bukkit.damage.DamageType;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerChangedWorldEvent;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.event.player.PlayerKickEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.inventory.EquipmentSlot;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.PlayerInventory;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.persistence.PersistentDataContainer;
import org.bukkit.persistence.PersistentDataType;
import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.scheduler.BukkitTask;
import org.bukkit.util.BoundingBox;
import org.bukkit.util.RayTraceResult;
import org.bukkit.util.Vector;

/** Owns all mutable state and main-thread work for the Death Beam module. */
public final class DeathBeamManager implements Listener, AutoCloseable {
    private static final double MAX_DISTANCE = 60.0D;
    private static final double RAY_STEP = 0.5D;
    private static final double DAMAGE_RADIUS = 3.5D;
    private static final double DAMAGE_RADIUS_SQUARED = DAMAGE_RADIUS * DAMAGE_RADIUS;
    private static final double DAMAGE_PER_TICK = 1.0D;
    private static final int STAR_CHARGE_SECONDS = 30;
    private static final int TICKS_PER_SECOND = 20;
    private static final int MAX_USE_DURATION_TICKS = 72_000;

    private final JavaPlugin plugin;
    private final NamespacedKey amuletStabilizedKey;
    private final NamespacedKey starChargeSecondsKey;
    private final Map<UUID, BeamSession> activeBeams = new HashMap<>();
    private final Set<UUID> damagedEntities = new HashSet<>();
    private BukkitTask tickTask;

    public DeathBeamManager(JavaPlugin plugin) {
        this.plugin = plugin;
        this.amuletStabilizedKey = new NamespacedKey(plugin, "amulet_stabilized");
        this.starChargeSecondsKey = new NamespacedKey(plugin, "star_charge_seconds");
    }

    public void enable() {
        plugin.getServer().getPluginManager().registerEvents(this, plugin);
        tickTask = plugin.getServer().getScheduler().runTaskTimer(plugin, this::tick, 1L, 1L);
    }

    @Override
    public void close() {
        if (tickTask != null) {
            tickTask.cancel();
            tickTask = null;
        }
        for (UUID playerId : activeBeams.keySet()) {
            Player player = plugin.getServer().getPlayer(playerId);
            if (player != null) player.clearActiveItem();
        }
        activeBeams.clear();
        damagedEntities.clear();
    }

    @EventHandler(priority = EventPriority.HIGHEST, ignoreCancelled = true)
    public void onInteract(PlayerInteractEvent event) {
        if (event.getHand() != EquipmentSlot.HAND) return;
        Action action = event.getAction();
        if (action != Action.RIGHT_CLICK_AIR && action != Action.RIGHT_CLICK_BLOCK) return;
        Player player = event.getPlayer();
        if (!canOperate(player) || !ensureFuelAvailable(player)) {
            stop(player, false);
            return;
        }
        activeBeams.computeIfAbsent(player.getUniqueId(), ignored -> new BeamSession(player));
        if (!player.hasActiveItem()) {
            player.startUsingItem(EquipmentSlot.HAND);
            player.setActiveItemRemainingTime(MAX_USE_DURATION_TICKS);
        }
        event.setCancelled(true);
    }

    @EventHandler(priority = EventPriority.MONITOR)
    public void onStopUsingItem(PlayerStopUsingItemEvent event) {
        if (event.getItem().getType() == Material.DRAGON_EGG) stop(event.getPlayer(), false);
    }

    @EventHandler public void onQuit(PlayerQuitEvent event) { stop(event.getPlayer(), false); }
    @EventHandler public void onKick(PlayerKickEvent event) { stop(event.getPlayer(), false); }
    @EventHandler public void onWorldChange(PlayerChangedWorldEvent event) { stop(event.getPlayer(), true); }

    private void tick() {
        Iterator<Map.Entry<UUID, BeamSession>> iterator = activeBeams.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<UUID, BeamSession> entry = iterator.next();
            Player player = plugin.getServer().getPlayer(entry.getKey());
            if (player == null || !player.isOnline() || !isStillUsingBeam(player)) {
                iterator.remove();
                continue;
            }
            if (!consumeChargeTick(player, entry.getValue())) {
                player.clearActiveItem();
                iterator.remove();
                continue;
            }
            renderAndDamage(player);
        }
    }

    private boolean isStillUsingBeam(Player player) {
        return player.hasActiveItem() && player.getActiveItemHand() == EquipmentSlot.HAND && canOperate(player);
    }

    private boolean canOperate(Player player) {
        return !player.isDead()
                && player.getInventory().getItemInMainHand().getType() == Material.DRAGON_EGG
                && hasStabilizedChestplate(player.getInventory().getChestplate());
    }

    private boolean hasStabilizedChestplate(ItemStack chestplate) {
        if (chestplate == null || chestplate.getType().isAir()) return false;
        ItemMeta meta = chestplate.getItemMeta();
        if (meta == null) return false;
        PersistentDataContainer data = meta.getPersistentDataContainer();
        return data.has(amuletStabilizedKey)
                || data.has(NamespacedKey.minecraft("amulet_stabilized"))
                || meta.hasCustomModelDataComponent();
    }

    private boolean ensureFuelAvailable(Player player) {
        if (readChargeSeconds(player) > 0) return true;
        if (!removeOneNetherStar(player.getInventory())) return false;
        writeChargeSeconds(player, STAR_CHARGE_SECONDS);
        return true;
    }

    private boolean consumeChargeTick(Player player, BeamSession session) {
        session.ticksUntilSecondDebit--;
        if (session.ticksUntilSecondDebit > 0) return true;
        int seconds = readChargeSeconds(player);
        if (seconds <= 0) {
            if (!removeOneNetherStar(player.getInventory())) return false;
            seconds = STAR_CHARGE_SECONDS;
        }
        writeChargeSeconds(player, seconds - 1);
        session.ticksUntilSecondDebit = TICKS_PER_SECOND;
        return true;
    }

    private int readChargeSeconds(Player player) {
        return Math.max(0, player.getPersistentDataContainer().getOrDefault(
                starChargeSecondsKey, PersistentDataType.INTEGER, 0));
    }

    private void writeChargeSeconds(Player player, int seconds) {
        player.getPersistentDataContainer().set(
                starChargeSecondsKey, PersistentDataType.INTEGER, Math.max(0, seconds));
    }

    private static boolean removeOneNetherStar(PlayerInventory inventory) {
        ItemStack[] contents = inventory.getStorageContents();
        for (int slot = 0; slot < contents.length; slot++) {
            ItemStack stack = contents[slot];
            if (stack == null || stack.getType() != Material.NETHER_STAR) continue;
            if (stack.getAmount() == 1) inventory.setItem(slot, null);
            else stack.setAmount(stack.getAmount() - 1);
            return true;
        }
        return false;
    }

    private void renderAndDamage(Player player) {
        Location eye = player.getEyeLocation();
        World world = eye.getWorld();
        Vector direction = eye.getDirection().normalize();
        Vector start = eye.toVector();
        double beamLength = findBeamLength(world, eye, direction);
        spawnBeamParticles(world, start, direction, beamLength);
        damageEntitiesAlongBeam(player, world, start, direction, beamLength);
    }

    private static double findBeamLength(World world, Location origin, Vector direction) {
        RayTraceResult hit = world.rayTraceBlocks(origin, direction, MAX_DISTANCE, FluidCollisionMode.NEVER, true);
        return hit == null ? MAX_DISTANCE : Math.max(0.0D, hit.getHitPosition().distance(origin.toVector()));
    }

    private static void spawnBeamParticles(World world, Vector start, Vector direction, double length) {
        double dx = direction.getX(), dy = direction.getY(), dz = direction.getZ();
        for (double distance = 0.0D; distance <= length; distance += RAY_STEP) {
            double x = start.getX() + dx * distance;
            double y = start.getY() + dy * distance;
            double z = start.getZ() + dz * distance;
            world.spawnParticle(Particle.DRAGON_BREATH, x, y, z, 1, 0.0D, 0.0D, 0.0D, 0.0D);
            if ((((int) (distance * 2.0D)) & 3) == 0)
                world.spawnParticle(Particle.END_ROD, x, y, z, 1, 0.0D, 0.0D, 0.0D, 0.0D);
        }
    }

    private void damageEntitiesAlongBeam(Player source, World world, Vector start, Vector direction, double length) {
        Vector end = start.clone().add(direction.clone().multiply(length));
        BoundingBox searchBox = BoundingBox.of(start, end).expand(DAMAGE_RADIUS);
        damagedEntities.clear();
        for (Entity entity : world.getNearbyEntities(searchBox, DeathBeamManager::isDamageableTarget)) {
            if (entity == source || !damagedEntities.add(entity.getUniqueId())) continue;
            LivingEntity target = (LivingEntity) entity;
            RayTraceResult intersection = target.getBoundingBox().expand(DAMAGE_RADIUS).rayTrace(start, direction, length);
            if (intersection == null && squaredDistanceToSegment(target.getLocation().toVector(), start, end)
                    > DAMAGE_RADIUS_SQUARED) continue;
            DamageSource damageSource = DamageSource.builder(DamageType.MAGIC)
                    .withCausingEntity(source).withDamageLocation(target.getLocation()).build();
            target.damage(DAMAGE_PER_TICK, damageSource);
        }
    }

    private static boolean isDamageableTarget(Entity entity) {
        return entity instanceof LivingEntity living && living.isValid() && !living.isDead();
    }

    private static double squaredDistanceToSegment(Vector point, Vector start, Vector end) {
        double sx = end.getX() - start.getX(), sy = end.getY() - start.getY(), sz = end.getZ() - start.getZ();
        double lengthSquared = sx * sx + sy * sy + sz * sz;
        if (lengthSquared == 0.0D) return point.distanceSquared(start);
        double projection = ((point.getX() - start.getX()) * sx + (point.getY() - start.getY()) * sy
                + (point.getZ() - start.getZ()) * sz) / lengthSquared;
        double clamped = Math.max(0.0D, Math.min(1.0D, projection));
        double dx = point.getX() - (start.getX() + sx * clamped);
        double dy = point.getY() - (start.getY() + sy * clamped);
        double dz = point.getZ() - (start.getZ() + sz * clamped);
        return dx * dx + dy * dy + dz * dz;
    }

    private void stop(Player player, boolean clearActiveItem) {
        activeBeams.remove(player.getUniqueId());
        if (clearActiveItem && player.hasActiveItem()) player.clearActiveItem();
    }

    private static final class BeamSession {
        private int ticksUntilSecondDebit;
        private BeamSession(Player player) {
            int remainder = Math.max(0, player.getActiveItemUsedTime()) % TICKS_PER_SECOND;
            this.ticksUntilSecondDebit = remainder == 0 ? TICKS_PER_SECOND : TICKS_PER_SECOND - remainder;
        }
    }
}
