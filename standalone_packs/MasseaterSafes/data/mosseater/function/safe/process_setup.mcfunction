# Обработка кнопок диалога настройки сейфа.
tag @a[scores={mosseater.safe_key=1..}] add ms_trig_key
tag @a[scores={mosseater.safe_cancel=1..}] add ms_trig_cancel

execute as @a[tag=ms_trig_key] at @s run function mosseater:safe/setup_key
execute as @a[tag=ms_trig_cancel] at @s run function mosseater:safe/setup_cancel

scoreboard players set @a[tag=ms_trig_key] mosseater.safe_key 0
scoreboard players set @a[tag=ms_trig_cancel] mosseater.safe_cancel 0
scoreboard players enable @a[tag=ms_trig_key] mosseater.safe_key
scoreboard players enable @a[tag=ms_trig_cancel] mosseater.safe_cancel

tag @a[tag=ms_trig_key] remove ms_trig_key
tag @a[tag=ms_trig_cancel] remove ms_trig_cancel
