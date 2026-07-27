# Гасты и Счастливые Гасты: брошенный динамит надевается на модельку.
# Скан идёт ДЛЯ ВСЕХ гастов без фильтра по счёту — именно фильтр мешал съесть первый ТНТ.
execute as @e[type=minecraft:happy_ghast] at @s run function nuke:happy_ghast/consume_item
execute as @e[type=minecraft:ghast] at @s run function nuke:happy_ghast/consume_item

execute as @e[type=minecraft:happy_ghast,scores={ghast_tnt=1..}] at @s run function nuke:happy_ghast/tick_one
execute as @e[type=minecraft:ghast,scores={ghast_tnt=1..}] at @s run function nuke:happy_ghast/tick_one
