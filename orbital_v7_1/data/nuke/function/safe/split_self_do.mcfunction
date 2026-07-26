# Выполняется as marker[safe_box], at @s. Сейф склеился в двойной сундук — расцепляем.
# Содержимое сохраняется через storage, замок восстанавливается из пароля маркера.
# Соседний сундук НЕ трогаем: как только сейф стал single, пара распадается,
# и чужие предметы гарантированно не теряются.
data modify storage nuke:safe box set from block ~ ~ ~

execute if block ~ ~ ~ minecraft:chest[facing=north] run setblock ~ ~ ~ minecraft:chest[type=single,facing=north] replace
execute if block ~ ~ ~ minecraft:chest[facing=south] run setblock ~ ~ ~ minecraft:chest[type=single,facing=south] replace
execute if block ~ ~ ~ minecraft:chest[facing=east] run setblock ~ ~ ~ minecraft:chest[type=single,facing=east] replace
execute if block ~ ~ ~ minecraft:chest[facing=west] run setblock ~ ~ ~ minecraft:chest[type=single,facing=west] replace

execute if data storage nuke:safe box.Items run data modify block ~ ~ ~ Items set from storage nuke:safe box.Items
data remove storage nuke:safe box

function nuke:safe/restore_lock_read

playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 0.7
particle minecraft:crit ~ ~0.6 ~ 0.3 0.3 0.3 10 0.01
title @a[distance=..6] actionbar {"text":"Защищённый сундук нельзя объединить в двойной","color":"red"}
