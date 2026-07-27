# Разворот вектора скорости снаряда. Контекст: as <снаряд>, at @s.
# Тег archi_reflected защищает от повторного разворота каждый тик.
scoreboard players set #neg1 nuke.settings -1
execute store result score #archi_x nuke.settings run data get entity @s Motion[0] 1000
execute store result score #archi_y nuke.settings run data get entity @s Motion[1] 1000
execute store result score #archi_z nuke.settings run data get entity @s Motion[2] 1000
scoreboard players operation #archi_x nuke.settings *= #neg1 nuke.settings
scoreboard players operation #archi_y nuke.settings *= #neg1 nuke.settings
scoreboard players operation #archi_z nuke.settings *= #neg1 nuke.settings
execute store result entity @s Motion[0] double 0.001 run scoreboard players get #archi_x nuke.settings
execute store result entity @s Motion[1] double 0.001 run scoreboard players get #archi_y nuke.settings
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #archi_z nuke.settings
execute if data entity @s power run function nuke:archi_shield/reflect_power
tag @s add archi_reflected

# Обратная связь строго в точке снаряда.
particle minecraft:crit ~ ~ ~ 0.2 0.2 0.2 0.1 6 force
playsound minecraft:item.shield.block master @a[distance=..16] ~ ~ ~ 1 1.2
