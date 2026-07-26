# Контекст: as <block_display lt_display>, at @s.
scoreboard players add @s orb_ticks 1

# ОДНА простая строка: переезд к своему заряду + приращение вращения.
# Относительные углы (~20 ~10) считаются от собственного поворота дисплея,
# поэтому ТНТ крутится в полёте без никаких цепочек и монтирования.
execute at @e[type=minecraft:wind_charge,tag=light_tnt,distance=..5,limit=1,sort=nearest] run tp @s ~ ~ ~ ~20 ~10

particle minecraft:smoke ~ ~0.25 ~ 0.05 0.05 0.05 2 0.01
particle minecraft:flame ~ ~0.25 ~ 0.05 0.05 0.05 1 0.01

# Заряд ещё летит — ждём.
execute if entity @e[type=minecraft:wind_charge,tag=light_tnt,distance=..5] run return 0

# Заряд схлопнулся (удар о блок/сущность) или вышло время — детонация.
function nuke:light_tnt/detonate
