# Сначала сохраняем факт клика: score нельзя обнулять до постановки transient tag.
execute as @a[scores={mosseater.safe_key=1..}] run tag @s add ms_safe_key_click
execute as @a[scores={mosseater.safe_cancel=1..}] run tag @s add ms_safe_cancel_click

# Затем сервер немедленно сбрасывает и повторно включает objectives.
execute as @a[tag=ms_safe_key_click] run scoreboard players set @s mosseater.safe_key 0
execute as @a[tag=ms_safe_key_click] run scoreboard players enable @s mosseater.safe_key
execute as @a[tag=ms_safe_cancel_click] run scoreboard players set @s mosseater.safe_cancel 0
execute as @a[tag=ms_safe_cancel_click] run scoreboard players enable @s mosseater.safe_cancel

# UX-обработчики работают по однокадровым тегам, уже после тихого reset/enable.
execute as @a[tag=ms_safe_key_click] at @s run function mosseater:safe/setup_key
execute as @a[tag=ms_safe_cancel_click] at @s run function mosseater:safe/setup_cancel

tag @a remove ms_safe_key_click
tag @a remove ms_safe_cancel_click

# Для первого клика после входа trigger всегда заранее доступен.
execute as @a run scoreboard players enable @s mosseater.safe_key
execute as @a run scoreboard players enable @s mosseater.safe_cancel
