# Вызывается из advancement nuke:chest_placed ПРИ ЛЮБОЙ установке сундука.
# Контекст: as <игрок>, at @s.
# Покрывает ОБА сценария сразу: и сундук к сейфу, и сейф к сундуку —
# потому что проверяется САМ СЕЙФ, а не то, что именно поставили.
execute as @e[type=minecraft:marker,tag=safe_box,distance=..8] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function nuke:safe/break_merge
execute as @e[type=minecraft:interaction,tag=safe_shield,distance=..8] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function nuke:safe/break_merge
