# MASSEATER SAFES — STANDALONE TICK (Minecraft 1.21.11)
execute as @a[tag=!ms_recipes] run function mosseater:setup_player

# Обработка кнопок диалога настройки.
function mosseater:safe/process_setup

# Автономная тиковая проверка всех сейфов.
function mosseater:safe/tick

# Хитбокс без сундука жить не должен.
execute as @e[type=minecraft:interaction,tag=ms_safe_shield] at @s unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run kill @s

execute as @a run function mosseater:enable_triggers
