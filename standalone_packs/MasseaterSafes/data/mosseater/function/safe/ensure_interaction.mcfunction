# Контекст: as <маркер>, at <центр блока>.
execute unless entity @e[tag=ms_safe_guard,distance=..0.8,limit=1,type=minecraft:interaction] run function mosseater:safe/place

execute if block ~ ~ ~ minecraft:chest[type=single] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~ ~-0.2 ~
execute if block ~ ~ ~ minecraft:trapped_chest as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~ ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~-0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~-0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~0.5 ~-0.2 ~
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~ ~-0.2 ~0.5
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~ ~-0.2 ~-0.5
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~ ~-0.2 ~-0.5
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tp @s ~ ~-0.2 ~0.5

execute if block ~ ~ ~ minecraft:chest[type=single] as @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction] run data merge entity @s {width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:trapped_chest as @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction] run data merge entity @s {width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] as @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction] run data merge entity @s {width:2.1f,height:1.4f,response:1b}

tag @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction] remove ms_safe_guard_configured
tag @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction] remove ms_safe_guard_keep_open
execute if entity @s[tag=ms_safe_configured] run tag @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_guard_configured
execute if entity @s[tag=ms_safe_keep_open] run tag @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_guard_keep_open

execute as @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] run tag @s add ms_safe_guard_keep
kill @e[tag=ms_safe_guard,tag=!ms_safe_guard_keep,distance=..0.8,type=minecraft:interaction]
tag @e[tag=ms_safe_guard_keep,distance=..0.8,type=minecraft:interaction] remove ms_safe_guard_keep
