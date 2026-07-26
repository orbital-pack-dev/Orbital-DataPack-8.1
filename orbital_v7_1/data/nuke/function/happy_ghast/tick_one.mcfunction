# Выполняется as Гаст, at @s
tp @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..10] ~ ~2.5 ~
particle minecraft:smoke ~ ~2.5 ~ 0.4 0.2 0.4 4 0.01

execute if score @s ghast_tnt matches 4.. run function nuke:happy_ghast/detonate
