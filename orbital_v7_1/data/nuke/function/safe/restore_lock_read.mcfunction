# Выполняется as marker[safe_box], at @s. Передаёт пароль в макрос восстановления замка.
execute unless data entity @s data.pw run return fail
data modify storage nuke:safe key.pw set from entity @s data.pw
function nuke:safe/restore_lock with storage nuke:safe key
data remove storage nuke:safe key.pw
