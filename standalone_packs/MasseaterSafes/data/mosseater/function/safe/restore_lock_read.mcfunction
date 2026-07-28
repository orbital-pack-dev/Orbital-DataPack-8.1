# Берём пароль из маркера сейфа и вешаем СТРОГИЙ замок обратно.
# Контекст: at <блок сейфа>.
data modify storage mosseater:safe key.pw set from entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..1.5,limit=1,sort=nearest] data.pw
execute unless data storage mosseater:safe key.pw run return 0
function mosseater:safe/apply_lock
data remove storage mosseater:safe key
