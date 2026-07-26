# Выполняется as block_display, at @s
scoreboard players add @s orb_ticks 1

# 1) Следовать за ветреным зарядом (позиция без потери собственного угла)
execute if entity @e[type=minecraft:wind_charge,tag=light_tnt,distance=..5] at @e[type=minecraft:wind_charge,tag=light_tnt,distance=..5,limit=1,sort=nearest] run tp @s ~ ~ ~

# 2) Непрерывное вращение: угол считается ОТ СВОЕГО же (rotated as @s),
# поэтому приращение накапливается и ТНТ крутится в полёте.
execute at @s rotated as @s run tp @s ~ ~ ~ ~27 ~13

particle minecraft:smoke ~ ~ ~ 0.06 0.06 0.06 2 0.01
particle minecraft:flame ~ ~ ~ 0.04 0.04 0.04 1 0.01

# 3) Заряд всё ещё в полёте — ждём, но страхуемся таймаутом 10 секунд.
execute if score @s orb_ticks matches 200.. run return run function nuke:light_tnt/detonate
execute if entity @e[type=minecraft:wind_charge,tag=light_tnt,distance=..5] run return 0

# 4) Заряд схлопнулся (столкновение с блоком/сущностью) — детонация.
function nuke:light_tnt/detonate
