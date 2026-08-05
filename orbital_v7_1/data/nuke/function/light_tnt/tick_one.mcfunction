# Контекст: as <block_display lt_display>, at @s. НИКАКИХ tp здесь нет.
scoreboard players add @s orb_ticks 1

particle minecraft:smoke ~ ~0.25 ~ 0.05 0.05 0.05 0.01 2
particle minecraft:flame ~ ~0.25 ~ 0.05 0.05 0.05 0.01 1

# Снаряд ещё летит рядом — просто ждём.
execute if entity @e[type=minecraft:wind_charge,tag=light_tnt,distance=..8] run return 0

# Страховка от вечных дисплеев.
execute if score @s orb_ticks matches 400.. run kill @s

# Снаряд схлопнулся (удар о блок/сущность) — взрыв на месте дисплея.
function nuke:light_tnt/detonate
