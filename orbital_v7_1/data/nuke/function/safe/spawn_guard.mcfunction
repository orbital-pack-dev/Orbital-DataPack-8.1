# Одиночный сундук: центр блока, смещение вниз на 0.2 и высота 1.4 —
# interaction перекрывает и низ сундука, и блок под ним (снизу не пробить).
execute if block ~ ~ ~ minecraft:chest[type=single] align xyz positioned ~0.5 ~-0.2 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:1.2f,height:1.4f,response:1b}

# Большой (двойной) сундук: середина между половинами, ширина 2.2.
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.2 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~-0.2 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~-0.2 ~-0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~-0.2 ~0.5 run summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_guard"],width:2.2f,height:1.4f,response:1b}
