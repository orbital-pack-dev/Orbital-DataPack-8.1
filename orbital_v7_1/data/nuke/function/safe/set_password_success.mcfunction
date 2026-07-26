# Контекст: as <маркер interaction сейфа>, at <блок сундука>.

# Пароль кладём в data storage. Раньше он писался в `entity @s data.password`,
# но ванильные сущности не хранят произвольные NBT-поля: и запись, и
# последующий `... with entity @s data` всегда падали с ошибкой.
data modify storage nuke:safe key.pw set from entity @a[tag=safe_user,limit=1] SelectedItem.components."minecraft:custom_name"

function nuke:safe/lock_chest_macro with storage nuke:safe key

# Временные данные обязательно чистим, иначе пароль остаётся в storage мира.
data remove storage nuke:safe key

# Болванка превращается в активный ключ.
item modify entity @a[tag=safe_user,limit=1] weapon.mainhand nuke:make_key_active

title @a[tag=safe_user,limit=1] actionbar {"text":"Пароль установлен! Сундук надёжно заперт.","color":"green"}
playsound minecraft:block.chest.locked master @a[tag=safe_user,limit=1] ~ ~ ~ 1 1

# Маркер настройки больше не нужен: замок дальше держит ваниль, без тика.
kill @s
