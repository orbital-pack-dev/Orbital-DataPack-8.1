# Контекст: as <маркер-донор>, at <его половина double chest>.
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~1 ~ ~ unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-1 ~ ~ unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-1 ~ ~ unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~1 ~ ~ unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~ ~1 unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~ ~-1 unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~ ~-1 unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~ ~1 unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run function mosseater:safe/clone_half
function mosseater:safe/ensure_interaction
