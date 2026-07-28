# Контекст: as <interaction сейфа>, at <блок сундука>.
# Пароль держим в storage: ванильные сущности не хранят произвольный NBT.
data modify storage mosseater:safe key.pw set from entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name"

function mosseater:safe/lock_chest_macro with storage mosseater:safe key

# Временные данные обязательно чистим.
data remove storage mosseater:safe key

# Болванка превращается в активный ключ.
item modify entity @a[tag=ms_safe_user,limit=1] weapon.mainhand mosseater:make_key_active

title @a[tag=ms_safe_user,limit=1] actionbar {text:"Пароль установлен! Сундук надёжно заперт.",color:"green"}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 1 1

kill @s
