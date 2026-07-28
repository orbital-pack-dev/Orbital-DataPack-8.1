# Контекст: as <маркер>, at <центр блока>.
execute unless entity @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,limit=1] run function mosseater:safe/place

# Точное центрирование после merge/split для всех 8 состояний double chest.
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~
execute if block ~ ~ ~ minecraft:trapped_chest as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~-0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~-0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~0.5
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~-0.5
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~-0.5
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tp @s ~ ~-0.2 ~0.5

execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8] run data merge entity @s {width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:trapped_chest as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8] run data merge entity @s {width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8] run data merge entity @s {width:2.1f,height:1.4f,response:1b}

# Дедупликация: при объединении двух ранее защищённых singles остаётся один hitbox.
execute as @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1] run tag @s add ms_safe_guard_keep
kill @e[type=minecraft:interaction,tag=ms_safe_guard,tag=!ms_safe_guard_keep,distance=..0.8]
tag @e[type=minecraft:interaction,tag=ms_safe_guard_keep,distance=..0.8] remove ms_safe_guard_keep
