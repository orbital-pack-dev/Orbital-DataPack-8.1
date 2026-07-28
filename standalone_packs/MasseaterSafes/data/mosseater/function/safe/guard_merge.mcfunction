# Вызывается из advancement mosseater:chest_placed ПРИ ЛЮБОЙ установке сундука.
# Контекст: as <игрок>, at @s.
# Соседний сундук больше не ломается — он присоединяется к сейфу и наследует пароль.
execute as @e[type=minecraft:marker,tag=ms_safe_box,distance=..8] at @s if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/adopt_merge
