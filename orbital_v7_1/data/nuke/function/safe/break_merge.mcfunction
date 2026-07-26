# ЖЁСТКАЯ АВТОПОЛОМКА склеенного сундука.
# Контекст: at <блок сейфа>, который СЕЙЧАС не single.
# Склеиться можно только с соседом, смотрящим В ТУ ЖЕ СТОРОНУ,
# и только по оси, перпендикулярной взгляду — поэтому чужие сундуки рядом в безопасности.
# Сосед ломается с выпадением предмета (destroy) — содержимое тоже выпадает.

execute if block ~ ~ ~ minecraft:chest[facing=north] if block ~1 ~ ~ minecraft:chest[facing=north] unless block ~1 ~ ~ minecraft:chest[facing=north,type=single] run setblock ~1 ~ ~ air destroy
execute if block ~ ~ ~ minecraft:chest[facing=north] if block ~-1 ~ ~ minecraft:chest[facing=north] unless block ~-1 ~ ~ minecraft:chest[facing=north,type=single] run setblock ~-1 ~ ~ air destroy
execute if block ~ ~ ~ minecraft:chest[facing=south] if block ~1 ~ ~ minecraft:chest[facing=south] unless block ~1 ~ ~ minecraft:chest[facing=south,type=single] run setblock ~1 ~ ~ air destroy
execute if block ~ ~ ~ minecraft:chest[facing=south] if block ~-1 ~ ~ minecraft:chest[facing=south] unless block ~-1 ~ ~ minecraft:chest[facing=south,type=single] run setblock ~-1 ~ ~ air destroy
execute if block ~ ~ ~ minecraft:chest[facing=east] if block ~ ~ ~1 minecraft:chest[facing=east] unless block ~ ~ ~1 minecraft:chest[facing=east,type=single] run setblock ~ ~ ~1 air destroy
execute if block ~ ~ ~ minecraft:chest[facing=east] if block ~ ~ ~-1 minecraft:chest[facing=east] unless block ~ ~ ~-1 minecraft:chest[facing=east,type=single] run setblock ~ ~ ~-1 air destroy
execute if block ~ ~ ~ minecraft:chest[facing=west] if block ~ ~ ~1 minecraft:chest[facing=west] unless block ~ ~ ~1 minecraft:chest[facing=west,type=single] run setblock ~ ~ ~1 air destroy
execute if block ~ ~ ~ minecraft:chest[facing=west] if block ~ ~ ~-1 minecraft:chest[facing=west] unless block ~ ~ ~-1 minecraft:chest[facing=west,type=single] run setblock ~ ~ ~-1 air destroy

# Сейф обязан остаться одиночным и запертым.
function nuke:safe/normalize_single

playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 1 0.8
particle minecraft:crit ~0.5 ~1 ~0.5 0.4 0.4 0.4 12 0.05
title @a[distance=..6] actionbar {"text":"Сейф нельзя соединять с сундуком!","color":"red","bold":true}
