# Контекст: as <маркер>, at <центр блока сундука>.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return run function mosseater:safe/drop

# Миграция состояния предыдущих сборок (#18/#19) без потери password/keep_open.
execute if entity @s[tag=ms_safe_unlocked] run function mosseater:safe/migrate_keep_open
execute if data entity @s data.pw run function mosseater:safe/migrate_password

# Если сундук стал двойным, создаём только отсутствующий marker второй половины.
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double

# Короткое окно доступа после правильного ключа.
execute if score @s mosseater.safe_data matches 1.. run scoreboard players remove @s mosseater.safe_data 1
execute if score @s mosseater.safe_data matches 1.. run kill @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..0.8]
execute if score @s mosseater.safe_data matches 1.. run return 0

execute if entity @s[tag=ms_safe_unconfigured] run return run function mosseater:safe/ensure_setup
function mosseater:safe/ensure_interaction

# Latest requirement: distance >= 4.0 инициирует relock; keep_open проверяется первым
# внутри auto_lock и полностью запрещает восстановление minecraft:lock.
execute unless entity @a[distance=..3.99] run function mosseater:safe/auto_lock
execute if entity @s[tag=ms_safe_keep_open] run data remove block ~ ~ ~ components."minecraft:lock"
