# ГАСТЫ: брошенный ДИНАМИТ рядом с Гастом — счётчик +1, предмет исчезает.
# Контекст — ПРЕДМЕТ, всё прямыми командами.
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:tnt"}}] at @s if entity @e[type=minecraft:happy_ghast,distance=..6] run function nuke:happy_ghast/eat_one
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:tnt"}}] at @s if entity @e[type=minecraft:ghast,distance=..6] run function nuke:happy_ghast/eat_one

execute as @e[type=minecraft:happy_ghast,scores={ghast_tnt=1..}] at @s run function nuke:happy_ghast/tick_one
execute as @e[type=minecraft:ghast,scores={ghast_tnt=1..}] at @s run function nuke:happy_ghast/tick_one
