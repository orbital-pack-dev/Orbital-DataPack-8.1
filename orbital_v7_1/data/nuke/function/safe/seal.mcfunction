# АВТОЗАКРЫТИЕ СЕЙФА. Контекст: as <маркер safe_box>, at @s.
# Вызывается только когда в радиусе 6 блоков никого нет.

# 1) Сброс временного доступа.
tag @a[distance=6..] remove safe_user
tag @a[distance=6..] remove safe_awaiting_key

# 2) Замок на месте — больше ничего не делаем (дешёвый выход).
execute if data block ~ ~ ~ components."minecraft:lock" run return 0

# 3) Сейф был разблокирован — запечатываем обратно.
function nuke:safe/restore_lock_read
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 0.8
particle minecraft:crit ~0.5 ~1 ~0.5 0.3 0.3 0.3 8 0.02
