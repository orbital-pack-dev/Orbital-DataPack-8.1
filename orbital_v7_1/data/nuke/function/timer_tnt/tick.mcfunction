# Only initialized marker entities tick; this file never summons anything.
execute as @e[type=minecraft:marker,tag=tt_marker,tag=tt_init] at @s run function nuke:timer_tnt/tick_one
