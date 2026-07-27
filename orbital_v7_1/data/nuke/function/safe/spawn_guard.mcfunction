# Single chest: exact block centre.
execute if block ~ ~ ~ minecraft:chest[type=single] align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:1.0f,height:1.0f,response:1b}

# Double chest: midpoint between both halves (type/facing aware).
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~ ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~ ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~ ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~ ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~ ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~ ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~ ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~ ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.0f,height:1.0f,response:1b}
