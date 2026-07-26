# Выполняется as marker[safe_box], at @s. Рядом (в 6 блоках) игроков нет.

# 1) Сброс временного доступа: никто из ушедших не остаётся «авторизованным».
tag @a[distance=6..] remove safe_user
tag @a[distance=6..] remove safe_awaiting_key

# 2) ЗАМОК ОТСУТСТВУЕТ — значит сейф был разблокирован/вскрыт или замок снесли
# извне (другой датапак, /data, дюп). Запечатываем обратно из пароля в маркере.
execute if data block ~ ~ ~ components."minecraft:lock" run return 0

function nuke:safe/restore_lock_read
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 0.8
particle minecraft:crit ~ ~0.6 ~ 0.3 0.3 0.3 8 0.01
