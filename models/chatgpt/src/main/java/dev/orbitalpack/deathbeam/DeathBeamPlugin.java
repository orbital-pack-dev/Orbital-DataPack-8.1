package dev.orbitalpack.deathbeam;

import org.bukkit.plugin.java.JavaPlugin;

public final class DeathBeamPlugin extends JavaPlugin {
    private DeathBeamManager deathBeamManager;

    @Override
    public void onEnable() {
        deathBeamManager = new DeathBeamManager(this);
        deathBeamManager.enable();
    }

    @Override
    public void onDisable() {
        if (deathBeamManager != null) {
            deathBeamManager.close();
            deathBeamManager = null;
        }
    }
}
