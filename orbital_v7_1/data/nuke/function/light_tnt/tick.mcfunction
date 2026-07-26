# Тик Лёгкого ТНТ - вращение и следование
execute as @e[type=wind_charge,tag=light_tnt] at @s run tp @e[type=block_display,tag=lt_display,distance=..3,limit=1] ~ ~ ~
execute as @e[type=block_display,tag=lt_display] at @s run tp @s ~ ~ ~ ~18 ~
execute as @e[type=block_display,tag=lt_display] at @s unless entity @e[type=wind_charge,tag=light_tnt,distance=..3] run function nuke:light_tnt/detonate
