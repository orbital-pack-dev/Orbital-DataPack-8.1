# Контекст: as <interaction сейфа>, at <блок сундука>.
# Пароль = компонент имени ключа. Копируем его структурно — без макро-подстановок.
data modify storage mosseater:safe key.pw set from entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name"
execute unless data storage mosseater:safe key.pw run return fail

function mosseater:safe/apply_lock
function mosseater:safe/bind_marker

# Временные данные обязательно чистим.
data remove storage mosseater:safe key

# Болванка превращается в активный ключ (имя-пароль сохраняется).
item modify entity @a[tag=ms_safe_user,limit=1] weapon.mainhand mosseater:make_key_active

title @a[tag=ms_safe_user,limit=1] actionbar {text:"Пароль установлен! Сундук надёжно заперт.",color:"green"}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 1 1

function mosseater:safe/ensure_interaction
kill @s
