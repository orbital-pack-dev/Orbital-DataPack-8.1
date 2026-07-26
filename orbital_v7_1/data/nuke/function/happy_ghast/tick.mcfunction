# Тик Взрывных Гастов.
# Все прикреплённые дисплеи двигаются вместе с гастом, а не только первый найденный.
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s run tp @e[type=block_display,tag=ghast_tnt_display,distance=..8] ~ ~2 ~

# Подбор брошенного ТНТ — только если рядом реально есть предмет.
execute as @e[type=#nuke:ghast_types] at @s if entity @e[type=item,distance=..3] run function nuke:happy_ghast/consume_item

# Детонация от огня, лавы или сильного удара.
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~ ~ #minecraft:fire run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~1 ~ #minecraft:fire run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~ ~ minecraft:lava run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if data entity @s {HurtTime:10s} run function nuke:happy_ghast/detonate
