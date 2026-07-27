# Keep one runtime interaction for a single or double Safe.
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run data merge entity @s {width:1.0f,height:1.0f}
execute unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run data merge entity @s {width:2.0f,height:1.0f}
execute unless entity @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1] if block ~ ~ ~ minecraft:chest[type=single] run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:1.0f,height:1.0f,response:1b}
execute unless entity @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1] unless block ~ ~ ~ minecraft:chest[type=single] run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
