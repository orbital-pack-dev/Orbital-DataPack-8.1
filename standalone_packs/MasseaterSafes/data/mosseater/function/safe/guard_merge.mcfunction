# Вызывается из advancement mosseater:chest_placed ПРИ ЛЮБОЙ установке сундука.
# Контекст: as <игрок>, at @s.
execute as @e[type=minecraft:marker,tag=ms_safe_box,distance=..8] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/break_merge
execute as @e[type=minecraft:interaction,tag=ms_safe_shield,distance=..8] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/break_merge
