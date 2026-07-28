# Контекст: as <маркер>, at <центр блока сундука>.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return run function mosseater:safe/drop

# Если сундук стал двойным, создаём недостающий маркер второй половины,
# не изменяя состояние уже защищённых соседей.
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double

# Короткое окно доступа после правильного ключа: interaction временно снят,
# а ванильный minecraft:lock выполняет окончательную проверку предмета.
execute if score @s mosseater.safe_data matches 1.. run scoreboard players remove @s mosseater.safe_data 1
execute if score @s mosseater.safe_data matches 1.. run kill @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8]
execute if score @s mosseater.safe_data matches 1.. run return 0

# Ненастроенный сейф всегда имеет setup-hitbox; диалог можно открыть повторным кликом.
execute if entity @s[tag=ms_safe_unconfigured] run return run function mosseater:safe/ensure_setup

# Настроенный/keep_open сейф всегда получает защитный interaction.
function mosseater:safe/ensure_interaction

# На дистанции больше 4 блоков возвращаем строгий lock, кроме keep_open.
execute unless entity @a[distance=..4] unless entity @s[tag=ms_safe_keep_open] run function mosseater:safe/auto_lock
execute if entity @s[tag=ms_safe_keep_open] run data remove block ~ ~ ~ components."minecraft:lock"
