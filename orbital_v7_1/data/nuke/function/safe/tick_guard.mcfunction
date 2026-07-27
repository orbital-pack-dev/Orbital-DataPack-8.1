# ПРОСТАЯ тиковая проверка всех сейфов. 4 строки, никакой магии.
# Маркер safe_box стоит в блоке запертого сейфа и хранит пароль.

# 1) Сейф сломали — маркер больше не нужен.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless block ~ ~ ~ minecraft:chest run kill @s

# 2) Сейф склеили в двойной сундук — жёсткая автополомка соседа.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function nuke:safe/break_merge

# 3) Автозакрытие: в радиусе 6 блоков нет ни одного игрока.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless entity @a[distance=..6] run function nuke:safe/seal

# 4) Сейф в режиме настройки тоже защищён от склейки.
execute as @e[type=minecraft:interaction,tag=safe_shield] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function nuke:safe/break_merge
