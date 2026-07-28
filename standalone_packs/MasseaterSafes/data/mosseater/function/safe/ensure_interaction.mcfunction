# Гарантируем, что interaction существует, стоит ровно на месте и имеет нужные габариты.
# Контекст: at <блок сундука>.
execute unless entity @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1] run function mosseater:safe/place

execute if block ~ ~ ~ minecraft:chest[type=single] align xyz positioned ~0.5 ~-0.2 ~0.5 as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.2 ~ as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.2 ~ as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.2 ~ as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.2 ~ as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~-0.2 ~0.5 as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~-0.2 ~-0.5 as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~-0.2 ~-0.5 as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~-0.2 ~0.5 as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6,limit=1,sort=nearest] run tp @s ~ ~ ~

# Габариты и отклик: одиночный сундук 1.1x1.4, большой сундук 2.2x1.4.
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6] run data merge entity @s {width:1.1f,height:1.4f,response:1b}
execute unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6] run data merge entity @s {width:2.2f,height:1.4f,response:1b}
