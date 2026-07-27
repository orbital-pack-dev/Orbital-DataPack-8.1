# Match displays to projectiles by nuke.pid; no nearest-entity cross-binding.
tag @e[type=minecraft:block_display,tag=lt_display] remove lt_has_projectile
execute as @e[type=minecraft:wind_charge,tag=light_tnt] at @s run function nuke:light_tnt/follow

# Шлейф за снарядом: дым + крит перекрывают зазор между ТНТ-дисплеем и зарядом.
execute as @e[type=minecraft:wind_charge,tag=light_tnt] at @s run particle minecraft:smoke ~ ~ ~ 0.12 0.12 0.12 0.01 4 force
execute as @e[type=minecraft:wind_charge,tag=light_tnt] at @s run particle minecraft:crit ~ ~ ~ 0.15 0.15 0.15 0.05 3 force

execute as @e[type=minecraft:block_display,tag=lt_display,tag=!lt_has_projectile] at @s run function nuke:light_tnt/detonate
