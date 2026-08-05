--- models/qwen/DeathBeamListener.java (原始)


+++ models/qwen/DeathBeamListener.java (修改后)
package models.qwen.deathbeam;

import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.inventory.ItemStack;
import org.jetbrains.annotations.NotNull;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/**
 * Event listener for Death Beam activation via Right-Click Mouse Button
 * Handles Dragon Egg right-click detection for beam activation
 */
public class DeathBeamListener implements Listener {

    private final DeathBeamManager manager;
    private final Set<UUID> holdingRMB;

    public DeathBeamListener(@NotNull DeathBeamManager manager) {
        this.manager = manager;
        this.holdingRMB = new HashSet<>();
    }

    /**
     * Handles player right-click interaction with Dragon Egg
     */
    @EventHandler(priority = EventPriority.HIGH, ignoreCancelled = true)
    public void onPlayerInteract(@NotNull PlayerInteractEvent event) {
        if (!(event.getAction() == Action.RIGHT_CLICK_AIR ||
              event.getAction() == Action.RIGHT_CLICK_BLOCK)) {
            return;
        }

        Player player = event.getPlayer();
        ItemStack item = event.getItem();

        if (item == null || item.getType() != Material.DRAGON_EGG) {
            return;
        }

        // Player is holding RMB with Dragon Egg - activate beam
        UUID playerId = player.getUniqueId();

        // Prevent double activation
        if (holdingRMB.contains(playerId)) {
            return;
        }

        holdingRMB.add(playerId);
        manager.startBeam(player);

        // Cancel the event to prevent placing the dragon egg
        event.setCancelled(true);
    }

    /**
     * Handles player left-click or release to stop beam
     */
    @EventHandler(priority = EventPriority.NORMAL, ignoreCancelled = true)
    public void onPlayerLeftClick(@NotNull PlayerInteractEvent event) {
        if (event.getAction() != Action.LEFT_CLICK_AIR &&
            event.getAction() != Action.LEFT_CLICK_BLOCK) {
            return;
        }

        Player player = event.getPlayer();
        UUID playerId = player.getUniqueId();

        if (holdingRMB.remove(playerId)) {
            manager.stopBeam(player);
        }
    }

    /**
     * Cleans up when player quits
     */
    @EventHandler(priority = EventPriority.NORMAL)
    public void onPlayerQuit(@NotNull PlayerQuitEvent event) {
        Player player = event.getPlayer();
        holdingRMB.remove(player.getUniqueId());
        manager.stopBeam(player);
    }

    /**
     * Checks if player is currently holding RMB with Dragon Egg
     */
    public boolean isHoldingRMB(@NotNull Player player) {
        return holdingRMB.contains(player.getUniqueId());
    }

    /**
     * Clears all RMB states (for disable/reload)
     */
    public void clearAllStates() {
        holdingRMB.clear();
    }
}