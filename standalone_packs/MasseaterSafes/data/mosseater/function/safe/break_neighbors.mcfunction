# Контекст: at <блок сейфа>. Ломаем только обычные соседние сундуки.
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
