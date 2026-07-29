# Сервер заранее держит trigger objectives включёнными и сброшенными.
execute as @a run scoreboard players enable @s mosseater.safe_key
execute as @a run scoreboard players enable @s mosseater.safe_cancel
execute as @a[scores={mosseater.safe_key=1..}] run scoreboard players set @s mosseater.safe_key 0
execute as @a[scores={mosseater.safe_key=0}] run scoreboard players enable @s mosseater.safe_key
execute as @a[scores={mosseater.safe_cancel=1..}] run scoreboard players set @s mosseater.safe_cancel 0
execute as @a[scores={mosseater.safe_cancel=0}] run scoreboard players enable @s mosseater.safe_cancel

# UX-обработчики запускаются через однокадровые player tags, не через score после reset.
execute as @a[scores={mosseater.safe_key=1..}] run tag @s add ms_safe_key_click
execute as @a[scores={mosseater.safe_cancel=1..}] run tag @s add ms_safe_cancel_click
execute as @a[tag=ms_safe_key_click] at @s run function mosseater:safe/setup_key
execute as @a[tag=ms_safe_cancel_click] at @s run function mosseater:safe/setup_cancel
tag @a remove ms_safe_key_click
tag @a remove ms_safe_cancel_click
