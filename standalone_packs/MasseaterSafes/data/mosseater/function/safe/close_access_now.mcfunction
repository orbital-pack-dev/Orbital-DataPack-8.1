# Досрочное закрытие при distance >= 4.
function mosseater:safe/apply_marker_lock
tag @s remove ms_safe_access_open
scoreboard players set @s mosseater.safe_data 0
function mosseater:safe/ensure_interaction
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 1.0
