# Context: Safe marker at block centre. Normalize any existing guard position.
execute align xyz positioned ~0.5 ~ ~0.5 as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run data merge entity @s {width:1.0f,height:1.0f}
execute unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run data merge entity @s {width:2.0f,height:1.0f}
execute unless entity @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1] run function nuke:safe/spawn_guard
