# ORBITAL RAILGUN - LOAD

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

# Идентификатор владельца заряда. Нужен, чтобы урон от ТНТ/пушек
# наносился ОТ ИМЕНИ игрока и сервер засчитывал убийства и лут.
scoreboard objectives add nuke.pid dummy

# ── Триггеры для диалоговых кнопок (игрок может /trigger без OP) ────
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

# ── Настройки по умолчанию ────────────────────────────
# nuke.cfg_ready = 1 после первой инициализации.
# /reload не затирает твои значения повторно; чтобы сбросить настройки
# на дефолт вручную, используй /function nuke:settings/reset
execute unless score nuke.cfg_ready nuke.settings matches 1 run function nuke:settings/reset
scoreboard players set nuke.cfg_ready nuke.settings 1
scoreboard objectives add orb_ticks dummy
scoreboard objectives add orb_lifetime dummy
scoreboard players set #20 nuke.settings 20
scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add damage_blocked_by_shield minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add shield_used minecraft.used:minecraft.shield
scoreboard objectives add sneak_time minecraft.custom:minecraft.sneak_time

scoreboard objectives add bv_active dummy
scoreboard objectives add bv_timer dummy
scoreboard objectives add ghast_tnt dummy
scoreboard objectives add tt_timer dummy
scoreboard objectives add tt_hours dummy
scoreboard objectives add tt_seconds dummy
scoreboard objectives add tt_mod dummy

# Счётчик выданных идентификаторов владельцев (не сбрасывать!).
execute unless score #pid_seq nuke.settings matches 0.. run scoreboard players set #pid_seq nuke.settings 0
