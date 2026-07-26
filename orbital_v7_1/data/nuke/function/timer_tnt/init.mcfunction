# Контекст: as <упавший предмет Таймер-ТНТ>, at @s.
tag @s add tt_init

# Уровень заряда (1..4 часа) — простые проверки без макросов.
scoreboard players set #tt_hours nuke.settings 1
execute if items entity @s contents minecraft:tnt[minecraft:custom_data~{timer_tnt:2}] run scoreboard players set #tt_hours nuke.settings 2
execute if items entity @s contents minecraft:tnt[minecraft:custom_data~{timer_tnt:3}] run scoreboard players set #tt_hours nuke.settings 3
execute if items entity @s contents minecraft:tnt[minecraft:custom_data~{timer_tnt:4}] run scoreboard players set #tt_hours nuke.settings 4

function nuke:timer_tnt/place
