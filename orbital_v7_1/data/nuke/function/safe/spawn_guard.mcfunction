# Одиночный сундук: центр блока, со смещением вниз на 0.1 — габарит 1.2×1.2
# полностью накрывает низ сундука (раньше width был 1.0 и низ оставался открытым).
execute if block ~ ~ ~ minecraft:chest[type=single] align xyz positioned ~0.5 ~-0.1 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:1.2f,height:1.2f,response:1b}

# Большой (двойной) сундук: середина между половинами, габарит 2.2×2.2.
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.1 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.1 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.1 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.1 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~-0.1 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~-0.1 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~-0.1 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~-0.1 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:2.2f,response:1b}
