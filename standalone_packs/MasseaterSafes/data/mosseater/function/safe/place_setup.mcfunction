# Setup-hitbox ставится теми же размерами/координатами, но с отдельным состоянием.
execute if block ~ ~ ~ minecraft:chest[type=single] positioned ~ ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:trapped_chest positioned ~ ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~-0.5 ~-0.2 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~-0.5 ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~-0.5 ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~-0.5 ~-0.2 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_setup"],width:2.1f,height:1.4f,response:1b}
