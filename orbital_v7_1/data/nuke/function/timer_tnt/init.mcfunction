# Контекст: as <упавший предмет Таймер-ТНТ>, at @s.
tag @s add tt_init

# Уровень 1..4 — простое чтение custom_data у предмета.
scoreboard players set #tt_hours nuke.settings 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set #tt_hours nuke.settings 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set #tt_hours nuke.settings 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set #tt_hours nuke.settings 4

function nuke:timer_tnt/place
kill @s
