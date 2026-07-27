# Detect any health decrease; HurtTime remains a secondary signal.
execute store result score @s nuke.temp run data get entity @s Health 100
execute if score @s nuke.temp < @s orb_ticks run function nuke:happy_ghast/blow_prepare
execute store result score #ghast_hurt nuke.settings run data get entity @s HurtTime
execute if score #ghast_hurt nuke.settings matches 1.. run function nuke:happy_ghast/blow_prepare
scoreboard players operation @s orb_ticks = @s nuke.temp
particle minecraft:smoke ~ ~-0.4 ~ 0.5 0.3 0.5 2 0.01
