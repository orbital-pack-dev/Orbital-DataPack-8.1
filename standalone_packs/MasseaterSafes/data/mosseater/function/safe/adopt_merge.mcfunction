# Автопривязка второй половины большого сундука.
# Контекст: as <маркер сейфа>, at <блок сейфа>, блок уже НЕ single.
# Партнёр определяется строго по facing/type, чтобы не задеть чужие сундуки рядом.
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~ ~1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~ ~1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8] run function mosseater:safe/adopt_half

# Хитбокс сразу масштабируется под большой сундук (2.2 x 1.4).
function mosseater:safe/ensure_interaction
