# СЕЙФЫ — ПРОСТАЯ ТИКОВАЯ ПРОВЕРКА. Прямые команды, без макросов в логике.

# 1) Сейфа больше нет — маркер удаляется.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless block ~ ~ ~ minecraft:chest run kill @s

# 2) АВТОПОЛОМКА: сейф склеился в двойной сундук — соседа в щепки.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function nuke:safe/break_merge
execute as @e[type=minecraft:interaction,tag=safe_shield] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function nuke:safe/break_merge

# 3) ДИСТАНЦИЯ 6 БЛОКОВ: нет игроков рядом — сейф мгновенно запечатан.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless entity @a[distance=..6] run function nuke:safe/seal
