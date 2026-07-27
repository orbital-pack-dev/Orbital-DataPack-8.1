# Детектор урона. Контекст: as <Гаст с зарядами>, at @s.
# Урон = ЛЮБОЕ снижение здоровья относительно прошлого тика (orb_ticks хранит снимок Health*100).
execute store result score @s nuke.temp run data get entity @s Health 100
execute if score @s nuke.temp < @s orb_ticks run return run function nuke:happy_ghast/blow_prepare
scoreboard players operation @s orb_ticks = @s nuke.temp
particle minecraft:smoke ~ ~-0.4 ~ 0.5 0.3 0.5 0.01 2
