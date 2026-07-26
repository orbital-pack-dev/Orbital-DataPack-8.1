# Обработка кнопок диалога настройки сейфа.
# Триггеры позволяют игроку без OP отправить сигнал, поэтому значение
# обязательно сбрасывается и заново включается ТОЛЬКО тем, кто его использовал
# (раньше `scoreboard players reset * ...` глушил триггер у всех и каждый тик).
tag @a[scores={t_safe_key=1..}] add safe_trig_key
tag @a[scores={t_safe_cancel=1..}] add safe_trig_cancel

execute as @a[tag=safe_trig_key] at @s run function nuke:safe/setup_key
execute as @a[tag=safe_trig_cancel] at @s run function nuke:safe/setup_cancel

scoreboard players set @a[tag=safe_trig_key] t_safe_key 0
scoreboard players set @a[tag=safe_trig_cancel] t_safe_cancel 0
scoreboard players enable @a[tag=safe_trig_key] t_safe_key
scoreboard players enable @a[tag=safe_trig_cancel] t_safe_cancel

tag @a[tag=safe_trig_key] remove safe_trig_key
tag @a[tag=safe_trig_cancel] remove safe_trig_cancel
