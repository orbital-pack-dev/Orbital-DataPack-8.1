# ТОЧКА ВХОДА. Контекст: as <упавший предмет Таймер-ТНТ>, at @s.
# ПЕРВОЙ СТРОКОЙ вешаем tt_init — повторный заход невозможен.
tag @s add tt_init

# В воде заряд НЕ взводится вообще — лежит обычным предметом.
execute if block ~ ~ ~ minecraft:water run return 0

# Уровень 1..4 из custom_data предмета.
scoreboard players set #tt_hours nuke.settings 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set #tt_hours nuke.settings 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set #tt_hours nuke.settings 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set #tt_hours nuke.settings 4

# Ровно по центру блока, чтобы маркер и визуал не расъехались.
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function nuke:timer_tnt/place
kill @s
