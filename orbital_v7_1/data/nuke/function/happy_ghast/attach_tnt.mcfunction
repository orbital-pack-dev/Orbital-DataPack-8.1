# Навешивает ровно ОДИН заряд. Контекст: as <Гаст>, at @s.
# Единая точка входа для обоих путей: ТНТ из руки (try_attach) и ТНТ с земли (eat_one).
# Потребление предмета — НА СТОРОНЕ ВЫЗЫВАЮЩЕГО (никакой рекурсии eat_one -> attach -> eat_one).
execute if score @s ghast_tnt matches 14.. run return fail
scoreboard players add @s ghast_tnt 1
scoreboard players set #gh_attached nuke.settings 1

# Снимок здоровья для детектора урона (сравнение «тик к тику» в tick_one).
execute store result score @s orb_ticks run data get entity @s Health 100

# Визуал: каждый индекс 1..14 — своя фиксированная 3D-точка вокруг центроида модели,
# дисплей садится пассажиром на Гаста (ride ... mount).
function nuke:happy_ghast/spawn_display

playsound minecraft:entity.tnt.primed master @a[distance=..24] ~ ~ ~ 1 1.2
particle minecraft:smoke ~ ~1 ~ 0.5 0.5 0.5 0.02 8
title @a[distance=..12] actionbar ["",{"text":"Гаст принял ТНТ: ","color":"gold"},{"score":{"name":"@s","objective":"ghast_tnt"},"color":"red","bold":true},{"text":" / 14","color":"gold"}]
