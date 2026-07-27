# Дисплей едет ЗА СНАРЯДОМ: контекст — СНАРЯД, не игрок.
execute as @e[type=minecraft:wind_charge,tag=light_tnt] at @s run tp @e[type=minecraft:block_display,tag=lt_display,distance=..8,limit=1,sort=nearest] ~ ~ ~
execute as @e[type=minecraft:block_display,tag=lt_display] at @s rotated as @s run tp @s ~ ~ ~ ~25 ~12
execute as @e[type=minecraft:block_display,tag=lt_display] at @s unless entity @e[type=minecraft:wind_charge,tag=light_tnt,distance=..8] run function nuke:light_tnt/detonate
