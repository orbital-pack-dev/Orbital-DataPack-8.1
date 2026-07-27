# ЛЁГКИЙ ТНТ — движение СТРОГО ОТ КООРДИНАТ СНАРЯДА.
# Контекст игрока здесь НЕ ИСПОЛЬЗУЕТСЯ вообще.

# 1) Идём ОТ КАЖДОГО СНАРЯДА и тянем его ближайший дисплей на свои координаты.
execute as @e[type=minecraft:wind_charge,tag=light_tnt] at @s run tp @e[type=minecraft:block_display,tag=lt_display,distance=..8,limit=1,sort=nearest] ~ ~ ~

# 2) Вращение дисплея вокруг себя (относительно собственного поворота).
execute as @e[type=minecraft:block_display,tag=lt_display] at @s rotated as @s run tp @s ~ ~ ~ ~25 ~12

# 3) Жизненный цикл и детонация.
execute as @e[type=minecraft:block_display,tag=lt_display] at @s run function nuke:light_tnt/tick_one
