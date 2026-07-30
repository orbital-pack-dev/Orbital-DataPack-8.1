# МОДУЛЬ 2 — Децентрализованный режим склада.
# Контекст: as <маркер ms_safe_box>, at <центр блока>.
#
# Никаких зон и глобальных маркеров: каждый маркер считает соседей сам.
# distance=..3.0 включает и самого себя, поэтому результат уменьшается на 1.
execute store result score @s ms_safe_neighbors if entity @e[tag=ms_safe_box,distance=..3.0,type=minecraft:marker]
scoreboard players remove @s ms_safe_neighbors 1
execute if score @s ms_safe_neighbors matches ..0 run scoreboard players set @s ms_safe_neighbors 0
