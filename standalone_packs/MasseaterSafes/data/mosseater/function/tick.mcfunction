# MASSEATER SAFES — STANDALONE TICK (Minecraft 1.21.11)
execute as @a[tag=!ms_recipes] run function mosseater:setup_player

# Обработка кнопок диалога настройки.
function mosseater:safe/process_setup

# Автономная тиковая проверка всех сейфов.
function mosseater:safe/tick

# ВАЖНО: защитный хитбокс стоит со смещением Y -0.2, поэтому его собственная
# позиция лежит в блоке ПОД сундуком. Проверять надо ~ ~0.2 ~, иначе уборщик
# убивал только что заспавненный interaction и сейф оставался без защиты.
execute as @e[type=minecraft:interaction,tag=ms_safe_shield] at @s unless block ~ ~0.2 ~ minecraft:chest unless block ~ ~0.2 ~ minecraft:trapped_chest run kill @s

execute as @a run function mosseater:enable_triggers
