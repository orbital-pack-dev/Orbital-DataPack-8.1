# Аудит-3: раньше поедание брошенного ТНТ вызывалось только для Гастов,
# у которых УЖЕ есть заряд (ghast_tnt=1..), поэтому ПЕРВЫЙ ТНТ не надевался никогда.
# Теперь скан предметов идёт для всех Гастов обоих типов.
execute as @e[type=minecraft:happy_ghast] at @s run function nuke:happy_ghast/consume_item
execute as @e[type=minecraft:ghast] at @s run function nuke:happy_ghast/consume_item

execute as @e[type=minecraft:happy_ghast,scores={ghast_tnt=1..}] at @s run function nuke:happy_ghast/tick_one
execute as @e[type=minecraft:ghast,scores={ghast_tnt=1..}] at @s run function nuke:happy_ghast/tick_one
