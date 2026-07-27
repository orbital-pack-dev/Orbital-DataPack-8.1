# Берём пароль из маркера и передаём в макрос восстановления замка.
# Контекст: at <блок сейфа>.
data modify storage nuke:safe key.pw set from entity @e[type=minecraft:marker,tag=safe_box,distance=..1.5,limit=1] data.pw
execute unless data storage nuke:safe key.pw run return 0
function nuke:safe/restore_lock with storage nuke:safe key
