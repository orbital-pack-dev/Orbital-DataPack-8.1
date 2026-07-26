# Контекст: as <block_display заряда>, at @s.
particle minecraft:smoke ~ ~0.25 ~ 0.05 0.05 0.05 2 0.01

# Пока wind_charge жив, заряд летит. Как только он исчез (столкновение) — взрыв.
execute if entity @e[type=minecraft:wind_charge,tag=light_tnt,distance=..2,limit=1] run return 0
function nuke:light_tnt/detonate
