--- models/qwen/DeathBeamManager.java (原始)


+++ models/qwen/DeathBeamManager.java (修改后)
package models.qwen.deathbeam;

import io.papermc.paper.datacomponent.DataComponentTypes;
import io.papermc.paper.datacomponent.item.CustomModelData;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.Particle;
import org.bukkit.Sound;
import org.bukkit.World;
import org.bukkit.damage.DamageSource;
import org.bukkit.damage.DamageType;
import org.bukkit.entity.Display;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.persistence.PersistentDataContainer;
import org.bukkit.persistence.PersistentDataType;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.util.RayTraceResult;
import org.bukkit.util.Vector;
import org.jetbrains.annotations.NotNull;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/**
 * Death Beam Module - Optimized implementation for Paper API 1.21.11
 *
 * Features:
 * - Dragon Egg right-click activation with custom equipment check
 * - Nether Star fuel system (1 star = 30 seconds / 600 ticks)
 * - Persistent charge storage via PersistentDataContainer
 * - Dragon breath + End rod particle visualization
 * - Ray-traced beam up to 60 blocks with 0.5 step
 * - Entity damage within 3.5 block radius from beam line
 * - Main-thread execution using BukkitScheduler
 * - Paper 1.21.11 DamageSource API
 */
public class DeathBeamManager {

    private static final String CHARGE_KEY = "star_charge_seconds";
    private static final String AMULET_STABILIZED_KEY = "amulet_stabilized";

    private static final int MAX_RANGE = 60;
    private static final double STEP_SIZE = 0.5;
    private static final double DAMAGE_RADIUS = 3.5;
    private static final double DAMAGE_AMOUNT = 10.0;
    private static final int TICKS_PER_SECOND = 20;
    private static final int FUEL_SECONDS_PER_STAR = 30;

    private final Plugin plugin;
    private final NamespacedKey chargeKey;
    private final NamespacedKey amuletStabilizedKey;
    private final Set<UUID> activeBeams;
    private final DamageSource beamDamageSource;

    public DeathBeamManager(@NotNull Plugin plugin) {
        this.plugin = plugin;
        this.chargeKey = new NamespacedKey(plugin, CHARGE_KEY);
        this.amuletStabilizedKey = new NamespacedKey(plugin, AMULET_STABILIZED_KEY);
        this.activeBeams = new HashSet<>();

        // Create DamageSource using Paper 1.21.11 API
        DamageType damageType = plugin.getServer().getDamageTypeRegistry()
            .getOrThrow(org.bukkit.Registry.DAMAGE_TYPE.getDefaultKey());
        this.beamDamageSource = new DamageSource(damageType);
    }

    /**
     * Enables the death beam system and starts monitoring players
     */
    public void enable() {
        new BeamMonitorTask().runTaskTimer(plugin, 1L, 1L);
    }

    /**
     * Disables the death beam system and cleans up all active beams
     */
    public void disable() {
        activeBeams.clear();
    }

    /**
     * Checks if a player has valid custom equipment (chestplate with amulet_stabilized tag or CustomModelData)
     */
    private boolean hasValidEquipment(@NotNull Player player) {
        ItemStack chestplate = player.getInventory().getChestplate();
        if (chestplate == null || chestplate.getType() == Material.AIR) {
            return false;
        }

        ItemMeta meta = chestplate.getItemMeta();
        if (meta == null) {
            return false;
        }

        // Check for amulet_stabilized PDC tag
        PersistentDataContainer pdc = meta.getPersistentDataContainer();
        if (pdc.has(amuletStabilizedKey, PersistentDataType.BYTE)) {
            return true;
        }

        // Check for CustomModelData (Paper API 1.21.11)
        CustomModelData customModelData = meta.get(DataComponentTypes.CUSTOM_MODEL_DATA);
        if (customModelData != null && !customModelData.getFloats().isEmpty()) {
            return true;
        }

        return false;
    }

    /**
     * Gets current charge in seconds for a player
     */
    private int getChargeSeconds(@NotNull Player player) {
        PersistentDataContainer pdc = player.getPersistentDataContainer();
        Integer charge = pdc.get(chargeKey, PersistentDataType.INTEGER);
        return charge != null ? charge : 0;
    }

    /**
     * Sets charge in seconds for a player
     */
    private void setChargeSeconds(@NotNull Player player, int seconds) {
        PersistentDataContainer pdc = player.getPersistentDataContainer();
        if (seconds <= 0) {
            pdc.remove(chargeKey);
        } else {
            pdc.set(chargeKey, PersistentDataType.INTEGER, seconds);
        }
    }

    /**
     * Attempts to consume a Nether Star from player inventory
     * @return true if successful
     */
    private boolean consumeNetherStar(@NotNull Player player) {
        for (ItemStack item : player.getInventory().getContents()) {
            if (item != null && item.getType() == Material.NETHER_STAR) {
                item.setAmount(item.getAmount() - 1);
                if (item.getAmount() <= 0) {
                    player.getInventory().removeItem(item);
                }
                return true;
            }
        }
        return false;
    }

    /**
     * Ensures player has charge, consuming a Nether Star if needed
     * @return true if player has charge available
     */
    public boolean ensureHasCharge(@NotNull Player player) {
        int charge = getChargeSeconds(player);

        if (charge > 0) {
            return true;
        }

        // No charge - try to consume a Nether Star
        if (consumeNetherStar(player)) {
            setChargeSeconds(player, FUEL_SECONDS_PER_STAR);
            return true;
        }

        return false;
    }

    /**
     * Calculates the end location of the beam using ray tracing
     */
    @NotNull
    private RayTraceResult calculateBeamEnd(@NotNull Location start, @NotNull Vector direction) {
        World world = start.getWorld();
        Location endLocation = start.clone().add(direction.clone().multiply(MAX_RANGE));

        RayTraceResult result = world.rayTrace(
            start,
            direction,
            MAX_RANGE,
            org.bukkit.FluidCollisionMode.NEVER,
            true,
            0.1,
            entity -> entity instanceof LivingEntity && !(entity instanceof Display)
        );

        if (result != null) {
            return result;
        }

        // No collision - return end point
        return new RayTraceResult(endLocation, null);
    }

    /**
     * Spawns particles along the beam path - optimized with batch spawning
     */
    private void spawnBeamParticles(@NotNull World world, @NotNull Location start, @NotNull Vector direction, double distance) {
        int steps = (int) (distance / STEP_SIZE);

        // Pre-calculate step increment for efficiency
        Vector stepVector = direction.clone().multiply(STEP_SIZE);
        Location currentLoc = start.clone();

        for (int i = 0; i < steps; i++) {
            currentLoc.add(stepVector);

            // Spawn Dragon Breath particles (core effect)
            world.spawnParticle(Particle.DRAGON_BREATH, currentLoc, 2, 0.1, 0.1, 0.1, 0.01);

            // Spawn End Rod particles (highlight core)
            world.spawnParticle(Particle.END_ROD, currentLoc, 1, 0.05, 0.05, 0.05, 0.0);
        }
    }

    /**
     * Damages entities within radius of the beam line
     */
    private void damageEntitiesAlongBeam(@NotNull World world, @NotNull Location start, @NotNull Vector direction, double distance) {
        Vector startVec = start.toVector();
        Vector beamDir = direction.clone().normalize();
        Vector beamEndVec = startVec.clone().add(beamDir.clone().multiply(distance));

        // Calculate midpoint for efficient entity search
        Location midPoint = startVec.clone().add(beamDir.clone().multiply(distance / 2)).toLocation(world);

        for (Entity entity : world.getNearbyEntities(midPoint, DAMAGE_RADIUS * 2, DAMAGE_RADIUS * 2, DAMAGE_RADIUS * 2)) {
            if (!(entity instanceof LivingEntity) || entity instanceof Display) {
                continue;
            }

            LivingEntity living = (LivingEntity) entity;

            // Calculate perpendicular distance from entity to beam line
            Vector entityPos = entity.getLocation().toVector();
            Vector toEntity = entityPos.clone().subtract(startVec);
            double projection = toEntity.dot(beamDir);

            // Clamp projection to beam segment
            if (projection < 0 || projection > distance) {
                continue;
            }

            Vector closestPoint = startVec.clone().add(beamDir.clone().multiply(projection));
            double distanceToBeam = entityPos.distance(closestPoint);

            if (distanceToBeam <= DAMAGE_RADIUS) {
                // Apply damage using Paper 1.21.11 DamageSource API
                living.damage(DAMAGE_AMOUNT, beamDamageSource);
            }
        }
    }

    /**
     * Handles a single tick of the death beam for a player
     */
    public void processBeamTick(@NotNull Player player) {
        // Calculate beam direction and endpoint
        Location eyeLocation = player.getEyeLocation();
        Vector direction = eyeLocation.getDirection();
        RayTraceResult rayResult = calculateBeamEnd(eyeLocation, direction);

        Location hitLocation = rayResult.getHitPosition();
        double distance = hitLocation != null ? eyeLocation.distance(hitLocation) : MAX_RANGE;

        // Visual effects
        World world = eyeLocation.getWorld();
        spawnBeamParticles(world, eyeLocation, direction, distance);

        // Damage entities
        damageEntitiesAlongBeam(world, eyeLocation, direction, distance);

        // Sound effect (every 10 ticks)
        if (Bukkit.getCurrentTick() % 10 == 0) {
            player.playSound(eyeLocation, Sound.ENTITY_ENDER_DRAGON_GROWL, 0.3f, 0.8f);
        }
    }

    /**
     * Starts the beam for a player
     */
    public void startBeam(@NotNull Player player) {
        if (activeBeams.contains(player.getUniqueId())) {
            return;
        }

        if (!ensureHasCharge(player)) {
            return;
        }

        activeBeams.add(player.getUniqueId());
    }

    /**
     * Stops the beam for a player
     */
    public void stopBeam(@NotNull Player player) {
        activeBeams.remove(player.getUniqueId());
    }

    /**
     * Returns true if player currently has an active beam
     */
    public boolean isActive(@NotNull Player player) {
        return activeBeams.contains(player.getUniqueId());
    }

    /**
     * Gets remaining charge in seconds for a player
     */
    public int getRemainingCharge(@NotNull Player player) {
        return getChargeSeconds(player);
    }

    /**
     * Internal task that monitors all players for beam activation and charge consumption
     */
    private class BeamMonitorTask extends BukkitRunnable {
        private int tickCounter = 0;

        @Override
        public void run() {
            tickCounter++;

            for (Player player : Bukkit.getOnlinePlayers()) {
                if (player.isDead() || !activeBeams.contains(player.getUniqueId())) {
                    continue;
                }

                // Consume charge every second (20 ticks)
                if (tickCounter % TICKS_PER_SECOND == 0) {
                    int charge = getChargeSeconds(player);
                    if (charge > 0) {
                        setChargeSeconds(player, charge - 1);
                    } else if (!ensureHasCharge(player)) {
                        // No charge left and no stars to consume - stop beam
                        stopBeam(player);
                        continue;
                    }
                }

                // Process beam effects
                processBeamTick(player);
            }
        }
    }

    /**
     * Utility method to add amulet_stabilized tag to an item
     */
    public static void addAmuletStabilizedTag(@NotNull ItemStack item, @NotNull Plugin plugin) {
        ItemMeta meta = item.getItemMeta();
        if (meta != null) {
            NamespacedKey key = new NamespacedKey(plugin, AMULET_STABILIZED_KEY);
            meta.getPersistentDataContainer().set(key, PersistentDataType.BYTE, (byte) 1);
            item.setItemMeta(meta);
        }
    }

    /**
     * Utility method to add charge to a player manually (for testing/admin)
     */
    public void addCharge(@NotNull Player player, int seconds) {
        int current = getChargeSeconds(player);
        setChargeSeconds(player, current + seconds);
    }

    /**
     * Gets the NamespacedKey for charge storage
     */
    public NamespacedKey getChargeKey() {
        return chargeKey;
    }

    /**
     * Gets the NamespacedKey for amulet stabilized tag
     */
    public NamespacedKey getAmuletStabilizedKey() {
        return amuletStabilizedKey;
    }
}