# Контекст: as <маркер>, at <центр блока сундука>.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return run function mosseater:safe/drop

# МОДУЛЬ 4. Детектор заряда. Пока блок существует, состояние мины хранится
# тегом на маркере: после разрушения блока прочитать Items уже невозможно.
execute if data block ~ ~ ~ Items[{id:"minecraft:tnt"}] run tag @s add ms_safe_trapped
execute unless data block ~ ~ ~ Items[{id:"minecraft:tnt"}] run tag @s remove ms_safe_trapped

# КРИТИЧНО 2. ЕДИНСТВЕННЫЙ вектор кражи блоком — воронка РОВНО ПОД сейфом:
# в ванилле только она вытягивает предметы, боковые и верхняя только кладут.
# Поэтому она проверяется КАЖДЫЙ ТИК и ломается мгновенно, до первого цикла
# перекачки (воронка тянет раз в 8 тиков). Это ровно ОДНА проверка блока
# на сейф в тик — самая дешёвая операция из возможных.
execute align xyz positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper

# Остальные 5 сторон и выброс ключей — медленный проход раз в 10 тиков.
execute if score #protect_now mosseater.safe_config matches 1 run function mosseater:safe/protect_inventory

execute if entity @s[tag=ms_safe_unlocked] run function mosseater:safe/migrate_keep_open
execute if data entity @s data.pw run function mosseater:safe/migrate_password
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double
execute if block ~ ~ ~ minecraft:trapped_chest unless block ~ ~ ~ minecraft:trapped_chest[type=single] run function mosseater:safe/sync_double

# Окно доступа обрабатывается раньше всей защитной логики: пока оно открыто,
# сейф намеренно остаётся без lock и без хитбокса, чтобы работал vanilla GUI.
execute if score @s mosseater.safe_data matches 1.. run function mosseater:safe/access_window
execute if score @s mosseater.safe_data matches 1.. run return 0

# Окно закрыто: авторизация сейфа снимается, мина снова боевая.
tag @s remove ms_safe_auth

# Вне окна доступа сейф обязан быть запечатан.
execute if entity @s[tag=ms_safe_keep_open] align xyz run data merge block ~ ~ ~ {Lock:""}
execute if entity @s[tag=ms_safe_configured] run function mosseater:safe/reseal

execute if entity @s[tag=ms_safe_unconfigured] run return run function mosseater:safe/ensure_setup
function mosseater:safe/ensure_interaction
