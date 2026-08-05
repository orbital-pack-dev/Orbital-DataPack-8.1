scoreboard players enable @s t_stab_cd
scoreboard players enable @s t_nuke_cd
scoreboard players enable @s t_wither_cd
scoreboard players enable @s t_mortar_cd
scoreboard players enable @s t_archi_cd
scoreboard players enable @s t_xp_stab
scoreboard players enable @s t_xp_nuke
scoreboard players enable @s t_xp_wither
scoreboard players enable @s t_xp_mortar
scoreboard players enable @s t_xp_archi
scoreboard players enable @s t_vip
scoreboard players enable @s t_wither
scoreboard players enable @s t_orbital_nerf
scoreboard players enable @s t_block_protection
scoreboard players enable @s t_personal_cd
scoreboard players enable @s t_info
scoreboard players enable @s t_reset


scoreboard players enable @s t_bv_time
scoreboard players enable @s t_tt_scale

# Тумблер Орбитального комплекса.
scoreboard players enable @s t_orbital_enabled

# ЗАДАЧА 5 — КОРНЕВАЯ ПРИЧИНА НЕРАБОТАЮЩИХ НАСТРОЕК.
# process_triggers записывал выбор игрока только в nuke.settings, а sync_config
# вызывался лишь в load и при сбросе — поэтому новые значения доходили до логики
# только после следующего /reload. Теперь зеркалирование идёт сразу после обработки триггеров.
function nuke:settings/sync_config
