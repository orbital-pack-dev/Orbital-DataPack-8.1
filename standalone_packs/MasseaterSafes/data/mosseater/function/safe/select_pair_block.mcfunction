# Контекст: positioned <геометрический центр блока сейфа>.
# Радиус 0.75 от центра блока покрывает только собственный маркер: маркер
# соседнего блока по любой оси удалён минимум на 1.0.
tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_pair

# Вторая половина добавляется исключительно по ванильному состоянию блока.
execute as @e[tag=ms_safe_pair,type=minecraft:marker] at @s run function mosseater:safe/mark_pair
