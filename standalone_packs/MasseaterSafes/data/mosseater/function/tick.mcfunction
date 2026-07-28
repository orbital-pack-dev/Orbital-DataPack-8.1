# MASSEATER SAFES — единый автономный тик (Minecraft 1.21.11)
execute as @a[tag=!ms_recipes] run function mosseater:setup_player
function mosseater:safe/process_setup
function mosseater:safe/tick

# Удаление фантомных хитбоксов: у каждого shield обязан быть маркер сейфа рядом.
execute as @e[type=minecraft:interaction,tag=ms_safe_shield] at @s unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8,limit=1] run kill @s

execute as @a run function mosseater:enable_triggers
