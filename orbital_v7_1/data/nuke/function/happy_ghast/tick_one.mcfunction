# Детектор урона + визуал заряда. Контекст: as <Гаст с зарядами>, at @s.
# Урон = ЛЮБОЕ снижение здоровья относительно прошлого тика (orb_ticks хранит снимок Health*100).
execute store result score @s nuke.temp run data get entity @s Health 100
execute if score @s nuke.temp < @s orb_ticks run return run function nuke:happy_ghast/blow_prepare
scoreboard players operation @s orb_ticks = @s nuke.temp

# Волнообразный визуал: фаза волны — по игровому времени (полсекунды низ / полсекунды верх),
# плотность частиц растёт с числом зарядов (1..4 / 5..9 / 10..14).
execute store result score #gh_wave nuke.settings run time query gametime
scoreboard players operation #gh_wave nuke.settings %= #20 nuke.settings

# Нижняя фаза волны.
execute if score #gh_wave nuke.settings matches ..9 if score @s ghast_tnt matches 1..4 run particle minecraft:smoke ~ ~-0.8 ~ 0.9 0.3 0.9 0.01 2
execute if score #gh_wave nuke.settings matches ..9 if score @s ghast_tnt matches 1..4 run particle minecraft:flame ~ ~-0.8 ~ 0.8 0.2 0.8 0.005 1
execute if score #gh_wave nuke.settings matches ..9 if score @s ghast_tnt matches 5..9 run particle minecraft:smoke ~ ~-0.8 ~ 1.2 0.4 1.2 0.01 5
execute if score #gh_wave nuke.settings matches ..9 if score @s ghast_tnt matches 5..9 run particle minecraft:flame ~ ~-0.8 ~ 1.0 0.3 1.0 0.008 3
execute if score #gh_wave nuke.settings matches ..9 if score @s ghast_tnt matches 10..14 run particle minecraft:smoke ~ ~-0.8 ~ 1.5 0.5 1.5 0.02 9
execute if score #gh_wave nuke.settings matches ..9 if score @s ghast_tnt matches 10..14 run particle minecraft:flame ~ ~-0.8 ~ 1.3 0.4 1.3 0.01 6
# Верхняя фаза волны.
execute if score #gh_wave nuke.settings matches 10.. if score @s ghast_tnt matches 1..4 run particle minecraft:smoke ~ ~0.6 ~ 0.9 0.3 0.9 0.01 2
execute if score #gh_wave nuke.settings matches 10.. if score @s ghast_tnt matches 1..4 run particle minecraft:flame ~ ~0.6 ~ 0.8 0.2 0.8 0.005 1
execute if score #gh_wave nuke.settings matches 10.. if score @s ghast_tnt matches 5..9 run particle minecraft:smoke ~ ~0.6 ~ 1.2 0.4 1.2 0.01 5
execute if score #gh_wave nuke.settings matches 10.. if score @s ghast_tnt matches 5..9 run particle minecraft:flame ~ ~0.6 ~ 1.0 0.3 1.0 0.008 3
execute if score #gh_wave nuke.settings matches 10.. if score @s ghast_tnt matches 10..14 run particle minecraft:smoke ~ ~0.6 ~ 1.5 0.5 1.5 0.02 9
execute if score #gh_wave nuke.settings matches 10.. if score @s ghast_tnt matches 10..14 run particle minecraft:flame ~ ~0.6 ~ 1.3 0.4 1.3 0.01 6
