# Выполняется as item, at @s
scoreboard players set #tt_hours nuke.settings 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set #tt_hours nuke.settings 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set #tt_hours nuke.settings 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set #tt_hours nuke.settings 4

scoreboard players set #tt_pid nuke.settings 0
execute as @p[distance=..12] run function nuke:util/assign_pid
execute if entity @p[distance=..12] run scoreboard players operation #tt_pid nuke.settings = @p[distance=..12] nuke.pid

# Тег tt_init ставится только внутри place при УСПЕШНОЙ установке,
# чтобы невалидное место повторило попытку в следующем тике.
execute align xyz run function nuke:timer_tnt/place
