execute as @a[scores={t_safe_key=1..}] at @s run function nuke:safe/setup_key
execute as @a[scores={t_safe_cancel=1..}] at @s run function nuke:safe/setup_cancel
scoreboard players reset * t_safe_key
scoreboard players reset * t_safe_cancel
