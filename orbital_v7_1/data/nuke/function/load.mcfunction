# ORBITAL DATAPACK — LOAD (Minecraft 1.21.11)
scoreboard objectives add use_rod minecraft.used:minecraft.fishing_rod
scoreboard objectives add raycast_limit dummy
scoreboard objectives add stabshot_timer dummy
scoreboard objectives add nukeshot_timer dummy
scoreboard objectives add withershot_timer dummy
scoreboard objectives add stab_delay dummy
scoreboard objectives add nuke_delay dummy
scoreboard objectives add wither_delay dummy
scoreboard objectives add mortar_delay dummy
scoreboard objectives add archi_delay dummy
scoreboard objectives add nuke.action_ok dummy
scoreboard objectives add nuke.can_upgrade dummy
scoreboard objectives add nuke.temp dummy
scoreboard objectives add nuke.power dummy
scoreboard objectives add up_check dummy
scoreboard objectives add up_msg dummy
scoreboard objectives add xp_level dummy
scoreboard objectives add nuke.settings dummy
scoreboard objectives add orbital_nerf dummy
scoreboard objectives add block_protection dummy
scoreboard objectives add personal_cd dummy
scoreboard objectives add nuke.bd_count dummy
scoreboard objectives add nuke.xp_cost dummy
scoreboard objectives add nuke.pid dummy

# Глобальные флаги конфига живут в отдельном объективе nuke.config.
# Меню (nuke.settings) — источник истины, nuke.config — то, что читает логика.
scoreboard objectives add nuke.config dummy

scoreboard objectives add t_stab_cd trigger
scoreboard objectives add t_nuke_cd trigger
scoreboard objectives add t_wither_cd trigger
scoreboard objectives add t_mortar_cd trigger
scoreboard objectives add t_archi_cd trigger
scoreboard objectives add t_xp_stab trigger
scoreboard objectives add t_xp_nuke trigger
scoreboard objectives add t_xp_wither trigger
scoreboard objectives add t_xp_mortar trigger
scoreboard objectives add t_xp_archi trigger
scoreboard objectives add t_vip trigger
scoreboard objectives add t_wither trigger
scoreboard objectives add t_orbital_nerf trigger
scoreboard objectives add t_block_protection trigger
scoreboard objectives add t_personal_cd trigger
scoreboard objectives add t_info trigger
scoreboard objectives add t_reset trigger
scoreboard objectives add t_safe_key trigger
scoreboard objectives add t_safe_cancel trigger
scoreboard objectives add t_bv_time trigger
scoreboard objectives add t_tt_scale trigger
# Триггер тумблера Орбитального комплекса (1 = ВКЛ, 2 = ВЫКЛ).
scoreboard objectives add t_orbital_enabled trigger

execute unless score nuke.cfg_ready nuke.settings matches 1 run function nuke:settings/reset
scoreboard players set nuke.cfg_ready nuke.settings 1

# ЗАДАЧА 5 — ФЛАГИ НЕ СБРАСЫВАЮТСЯ ПРИ /reload.
# Дефолты выставляются ТОЛЬКО если значение ещё не задано (unless ... matches 0..1).
# Уже выбранные игроком значения переживают и /reload, и перезапуск сервера.
execute unless score #block_protection nuke.config matches 0..1 run scoreboard players set #block_protection nuke.config 0
execute unless score #orbital_nerf nuke.config matches 0..1 run scoreboard players set #orbital_nerf nuke.config 0
execute unless score #personal_cd nuke.config matches 0..1 run scoreboard players set #personal_cd nuke.config 1
execute unless score #vip nuke.config matches 0..1 run scoreboard players set #vip nuke.config 1
execute unless score #wither_skulls nuke.config matches 0..1 run scoreboard players set #wither_skulls nuke.config 0
execute unless score #orbital_enabled nuke.config matches 0..1 run scoreboard players set #orbital_enabled nuke.config 1

# Меню выравнивается по сохранённым флагам, чтобы в диалогах отображалось то же самое.
scoreboard players operation block_protection nuke.settings = #block_protection nuke.config
scoreboard players operation orbital_nerf nuke.settings = #orbital_nerf nuke.config
scoreboard players operation personal_cd nuke.settings = #personal_cd nuke.config
scoreboard players operation nuke.cfg.vip nuke.settings = #vip nuke.config
scoreboard players operation nuke.cfg.wither nuke.settings = #wither_skulls nuke.config

scoreboard objectives add orb_ticks dummy
scoreboard objectives add orb_lifetime dummy
scoreboard players set #20 nuke.settings 20
scoreboard players set #four nuke.settings 4
scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add damage_blocked_by_shield minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add shield_used minecraft.used:minecraft.shield
scoreboard objectives add sneak_time dummy
scoreboard objectives add bv_active dummy
scoreboard objectives add bv_timer dummy
scoreboard objectives add bv_mod dummy
scoreboard objectives add ghast_tnt dummy
scoreboard objectives add tt_timer dummy
scoreboard objectives add tt_hours dummy
scoreboard objectives add tt_seconds dummy
scoreboard objectives add tt_mod dummy
execute unless score #pid_seq nuke.settings matches 0.. run scoreboard players set #pid_seq nuke.settings 0

# Сразу привязываем настройки меню к глобальным флагам.
function nuke:settings/sync_config
