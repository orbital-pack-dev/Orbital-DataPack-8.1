# One deterministic pass per Safe marker.
execute as @e[type=minecraft:marker,tag=safe_box] at @s run function nuke:safe/tick_one
