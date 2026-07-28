# mosseater:safe/tick — автономная тиковая проверка всех сейфов.
execute as @e[type=minecraft:marker,tag=ms_safe_box] at @s run function mosseater:safe/tick_one
