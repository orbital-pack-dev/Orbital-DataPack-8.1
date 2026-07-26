# Выполняется as игрок (награда достижения nuke:interact_ghast)
tag @s add gt_user
execute at @s as @e[type=minecraft:happy_ghast,distance=..7,limit=1,sort=nearest] at @s run function nuke:happy_ghast/try_attach
execute at @s unless entity @e[type=minecraft:happy_ghast,distance=..7] as @e[type=minecraft:ghast,distance=..7,limit=1,sort=nearest] at @s run function nuke:happy_ghast/try_attach
tag @s remove gt_user
