# Тик Взрывных Гастов

# Прикрепление Block Display ТНТ к Гасту
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s run tp @e[type=block_display,tag=ghast_tnt_display,distance=..8,limit=1,sort=nearest] ~ ~2 ~

# Обнаружение брошенного предмета ТНТ рядом (выполняется как item, at ghast)
execute as @e[type=#nuke:ghast_types] at @s as @e[type=item,distance=..3,nbt={Item:{id:"minecraft:tnt"}}] run function nuke:happy_ghast/consume_item

# Детонация при огне, лаве или попадании
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~ ~ #minecraft:fire run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~1 ~ #minecraft:fire run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~ ~ minecraft:lava run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..},nbt={HurtTime:10s}] at @s run function nuke:happy_ghast/detonate
