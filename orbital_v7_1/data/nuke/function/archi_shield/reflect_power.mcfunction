# Fireballs accelerate using power as well as Motion; reverse both vectors.
execute store result score #archi_x nuke.settings run data get entity @s power[0] 1000
execute store result score #archi_y nuke.settings run data get entity @s power[1] 1000
execute store result score #archi_z nuke.settings run data get entity @s power[2] 1000
scoreboard players operation #archi_x nuke.settings *= #neg1 nuke.settings
scoreboard players operation #archi_y nuke.settings *= #neg1 nuke.settings
scoreboard players operation #archi_z nuke.settings *= #neg1 nuke.settings
execute store result entity @s power[0] double 0.001 run scoreboard players get #archi_x nuke.settings
execute store result entity @s power[1] double 0.001 run scoreboard players get #archi_y nuke.settings
execute store result entity @s power[2] double 0.001 run scoreboard players get #archi_z nuke.settings
