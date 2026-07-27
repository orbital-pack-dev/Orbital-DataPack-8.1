# Context: at Safe marker. Destroy adjacent ordinary chests only.
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=safe_box,distance=..0.8,limit=1] run setblock ~ ~ ~ air destroy
