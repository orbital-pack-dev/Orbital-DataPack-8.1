# mosseater:safe/auto_lock — вызывается, когда ближайший игрок дальше 4 блоков.
# Контекст: as <маркер сейфа>, at <блок сундука>.
tag @a remove ms_safe_user
tag @a remove ms_safe_awaiting_key

# Настроенный сейф: возвращаем ИМЕННО его пароль.
execute if data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run function mosseater:safe/restore_lock_read

# Ненастроенный сейф держит обычный замок под любой активный ключ.
execute unless data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}

# Запечатывание ВСЕГДА возвращает interaction и нормализует его габариты.
function mosseater:safe/ensure_interaction
