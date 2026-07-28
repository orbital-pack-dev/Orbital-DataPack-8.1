# mosseater:safe/auto_lock — вызывается, когда ближайший игрок дальше 4 блоков.
# Контекст: as <маркер сейфа>, at <блок сундука>.
tag @a remove ms_safe_user
tag @a remove ms_safe_awaiting_key

# «Оставить открытым»: автоматическое запечатывание ИГНОРИРУЕТСЯ полностью,
# и любой оставшийся замок снимается.
execute if entity @s[tag=ms_safe_unlocked] run data remove block ~ ~ ~ components."minecraft:lock"

# Настроенный сейф: возвращаем ИМЕННО его замок (точная копия имени ключа).
execute unless entity @s[tag=ms_safe_unlocked] if data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run function mosseater:safe/restore_lock_read

# Ещё не настроенный сейф держит временный замок под любой активный ключ.
execute unless entity @s[tag=ms_safe_unlocked] unless data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}

# Хитбокс восстанавливается ВСЕГДА — даже у открытого сейфа, иначе его ломают.
function mosseater:safe/ensure_interaction
