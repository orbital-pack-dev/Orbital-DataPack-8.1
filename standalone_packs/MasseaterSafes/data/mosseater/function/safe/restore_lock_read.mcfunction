# Берём пароль из маркера и передаём в макрос восстановления замка.
# Контекст: at <блок сейфа>.
data modify storage mosseater:safe key.pw set from entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..1.5,limit=1] data.pw
execute unless data storage mosseater:safe key.pw run return 0
function mosseater:safe/restore_lock with storage mosseater:safe key
