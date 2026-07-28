# Контекст: as <маркер>, at <центр блока>.
execute unless entity @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,limit=1] run function mosseater:safe/place

# Нормализация позиции/размера после merge/split.
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~
execute if block ~ ~ ~ minecraft:trapped_chest as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8] run data merge entity @s {width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:trapped_chest as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8] run data merge entity @s {width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8] run data merge entity @s {width:2.1f,height:1.4f,response:1b}
