# Приводим сейф к chest[type=single], СОХРАНЯЯ содержимое и замок.
# Контекст: at <блок сейфа>.
execute if block ~ ~ ~ minecraft:chest[type=single] run return 0

data modify storage nuke:safe box set from block ~ ~ ~ Items

execute if block ~ ~ ~ minecraft:chest[facing=north] run setblock ~ ~ ~ minecraft:chest[type=single,facing=north] replace
execute if block ~ ~ ~ minecraft:chest[facing=south] run setblock ~ ~ ~ minecraft:chest[type=single,facing=south] replace
execute if block ~ ~ ~ minecraft:chest[facing=east] run setblock ~ ~ ~ minecraft:chest[type=single,facing=east] replace
execute if block ~ ~ ~ minecraft:chest[facing=west] run setblock ~ ~ ~ minecraft:chest[type=single,facing=west] replace

data modify block ~ ~ ~ Items set from storage nuke:safe box
data remove storage nuke:safe box

# Замок восстанавливаем из пароля, хранящегося в маркере.
execute if entity @e[type=minecraft:marker,tag=safe_box,distance=..1.5] run function nuke:safe/restore_lock_read
