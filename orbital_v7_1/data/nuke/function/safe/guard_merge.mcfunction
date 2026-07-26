# Выполняется as игрок (награда достижения nuke:chest_placed) — мгновенная реакция
# в тот же тик, без ожидания общего тикового обхода.
# Работает для любого направления склейки: любой сейф рядом перепроверяет себя.
# Райкаст больше не нужен: маркер сейфа сам знает своё место.
execute as @e[type=minecraft:marker,tag=safe_box,distance=..10] at @s run function nuke:safe/guard_one
execute as @e[type=minecraft:interaction,tag=safe_shield,distance=..10] at @s run function nuke:safe/split_setup
