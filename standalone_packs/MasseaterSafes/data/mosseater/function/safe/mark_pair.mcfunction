# БАГ 1 — жёсткий поиск второй половины double chest.
# Контекст: as <маркер ms_safe_pair>, at <его блок>.
#
# Партнёр берётся ТОЛЬКО из ванильного состояния блока: facing + type=left|right.
# Смещение всегда чисто горизонтальное (dx или dz равно ровно 1), а Y задан как
# ~, то есть совпадение по высоте обязательно. Сундук на Y+1 или Y-1 физически
# не может быть найден этой таблицей, даже если стоит вплотную.
# Таблица направлений идентична init_partner и sync_double.
tag @s add ms_safe_pair

# --- minecraft:chest ---
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~ ~1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~ ~-1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~ ~-1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~ ~1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair

# --- minecraft:trapped_chest ---
execute if block ~ ~ ~ minecraft:trapped_chest[facing=north,type=left] positioned ~1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:trapped_chest[facing=north,type=right] positioned ~-1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:trapped_chest[facing=south,type=left] positioned ~-1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:trapped_chest[facing=south,type=right] positioned ~1 ~ ~ run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:trapped_chest[facing=east,type=left] positioned ~ ~ ~1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:trapped_chest[facing=east,type=right] positioned ~ ~ ~-1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:trapped_chest[facing=west,type=left] positioned ~ ~ ~-1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
execute if block ~ ~ ~ minecraft:trapped_chest[facing=west,type=right] positioned ~ ~ ~1 run tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair
