# Контекст: as <маркер>, at <центр блока сундука>.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return run function mosseater:safe/drop

execute if entity @s[tag=ms_safe_unlocked] run function mosseater:safe/migrate_keep_open
execute if data entity @s data.pw run function mosseater:safe/migrate_password

# Unconfigured double не клонируется: setup hitbox центрируется и ждёт пароль.
execute if block ~ ~ ~ minecraft:chest[type=single] run tag @s remove ms_safe_merge_warned
execute if entity @s[tag=ms_safe_unconfigured] if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/prevent_unconfigured_merge
execute if entity @s[tag=ms_safe_configured] if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double

# Статус мины сохраняется на marker до следующего тика даже после слома блока.
function mosseater:safe/update_trap_state
# Закрытый настроенный сейф не отдаёт инвентарь в hopper/hopper minecart.
execute if entity @s[tag=ms_safe_configured] run function mosseater:safe/protect_inventory

# Окно безопасного демонтажа выдаётся только после успешной проверки ключа.
execute if score @s mosseater.safe_auth matches 1.. run scoreboard players remove @s mosseater.safe_auth 1

# Lock возвращается сразу при distance >= 4, но защитный interaction получает
# отдельную задержку rearm 60 тиков.
execute unless entity @a[distance=..3.99] run function mosseater:safe/auto_lock
execute if entity @s[tag=ms_safe_keep_open] run data remove block ~ ~ ~ components."minecraft:lock"

# Единый таймер повторного включения interaction.
execute if score @s mosseater.safe_data matches 1.. run scoreboard players remove @s mosseater.safe_data 1
execute if score @s mosseater.safe_data matches 1.. run kill @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction]
execute if score @s mosseater.safe_data matches 1.. run return 0

execute if entity @s[tag=ms_safe_unconfigured] run return run function mosseater:safe/ensure_setup
function mosseater:safe/ensure_interaction
