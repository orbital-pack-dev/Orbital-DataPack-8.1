# Выполняется as interaction[safe_shield], at @s — сейф в процессе настройки (пустой).
execute if block ~ ~ ~ minecraft:chest[type=single] run return 0

data modify storage nuke:safe box set from block ~ ~ ~

execute if block ~ ~ ~ minecraft:chest[facing=north] run setblock ~ ~ ~ minecraft:chest[type=single,facing=north] replace
execute if block ~ ~ ~ minecraft:chest[facing=south] run setblock ~ ~ ~ minecraft:chest[type=single,facing=south] replace
execute if block ~ ~ ~ minecraft:chest[facing=east] run setblock ~ ~ ~ minecraft:chest[type=single,facing=east] replace
execute if block ~ ~ ~ minecraft:chest[facing=west] run setblock ~ ~ ~ minecraft:chest[type=single,facing=west] replace

execute if data storage nuke:safe box.Items run data modify block ~ ~ ~ Items set from storage nuke:safe box.Items
data remove storage nuke:safe box

playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 0.7
title @a[distance=..6] actionbar {"text":"Сейф остаётся одиночным сундуком","color":"red"}
