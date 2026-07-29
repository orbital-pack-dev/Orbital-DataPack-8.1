# Контекст: as <маркер>, at <центр блока сундука>.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return run function mosseater:safe/drop

execute if entity @s[tag=ms_safe_unlocked] run function mosseater:safe/migrate_keep_open
execute if data entity @s data.pw run function mosseater:safe/migrate_password
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double

# Окно доступа обрабатывается раньше всей защитной логики: пока оно открыто,
# сейф намеренно остаётся без lock и без хитбокса, чтобы работал vanilla GUI.
execute if score @s mosseater.safe_data matches 1.. run function mosseater:safe/access_window
execute if score @s mosseater.safe_data matches 1.. run return 0

# Вне окна доступа сейф обязан быть запечатан.
execute if entity @s[tag=ms_safe_keep_open] align xyz run data remove block ~ ~ ~ components."minecraft:lock"
execute if entity @s[tag=ms_safe_configured] run function mosseater:safe/reseal

execute if entity @s[tag=ms_safe_unconfigured] run return run function mosseater:safe/ensure_setup
function mosseater:safe/ensure_interaction
