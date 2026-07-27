# Только взведённые маркеры (строго с tt_init). Ничего не спавнит.
execute as @e[type=minecraft:marker,tag=tt_marker,tag=tt_init] at @s run function nuke:timer_tnt/tick_one
