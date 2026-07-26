# Выполняется as Гаст, at @s. Скан брошенного рядом ТНТ.
execute as @e[type=minecraft:item,distance=..5] at @s if data entity @s Item{id:"minecraft:tnt"} run function nuke:happy_ghast/eat_one
