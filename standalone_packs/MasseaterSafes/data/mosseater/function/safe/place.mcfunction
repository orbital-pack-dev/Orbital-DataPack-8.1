# Защитный interaction. Контекст: at <центр одной половины>.
# Single: 1.1 x 1.4. Double: 2.1 x 1.4. Нижняя грань Y=-0.2.
execute if block ~ ~ ~ minecraft:chest[type=single] positioned ~ ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:trapped_chest positioned ~ ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:1.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~-0.2 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~-0.2 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["ms_safe_shield","ms_safe_guard"],width:2.1f,height:1.4f,response:1b}
