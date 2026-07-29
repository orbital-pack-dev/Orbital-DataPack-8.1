# Контекст: as <маркер>, at <центр блока сундука>.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return run function mosseater:safe/drop

execute if entity @s[tag=ms_safe_unlocked] run function mosseater:safe/migrate_keep_open
execute if data entity @s data.pw run function mosseater:safe/migrate_password
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double

# Если владелец отошёл дальше 4 блоков, lock возвращается досрочно.
execute unless entity @a[distance=..3.99] run function mosseater:safe/auto_lock
execute if entity @s[tag=ms_safe_keep_open] run data remove block ~ ~ ~ components."minecraft:lock"

# Единый 60-тактовый таймер: во время окна guard физически отсутствует.
execute if score @s mosseater.safe_data matches 1.. run scoreboard players remove @s mosseater.safe_data 1
execute if score @s mosseater.safe_data matches 1.. run kill @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction]
execute if score @s mosseater.safe_data matches 1.. run return 0

# На нуле восстанавливаем vanilla lock и затем singleton interaction.
execute if entity @s[tag=ms_safe_access_open] run function mosseater:safe/finish_access
execute if entity @s[tag=ms_safe_unconfigured] run return run function mosseater:safe/ensure_setup
function mosseater:safe/ensure_interaction
