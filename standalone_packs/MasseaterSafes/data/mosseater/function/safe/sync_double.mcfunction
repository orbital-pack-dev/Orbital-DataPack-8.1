# Контекст: as <маркер-донор>, at <его половина double chest>.
# Создаётся ТОЛЬКО отсутствующий маркер партнёра. Существующие соседние сейфы
# и их NBT никогда не перезаписываются.
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~1 ~ ~ unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-1 ~ ~ unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-1 ~ ~ unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~1 ~ ~ unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~ ~1 unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~ ~-1 unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~ ~-1 unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~ ~1 unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run function mosseater:safe/clone_half
function mosseater:safe/ensure_interaction
