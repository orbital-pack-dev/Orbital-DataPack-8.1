# Инициализация Таймер-ТНТ. @s = брошенный предмет tnt_minecart с custom_data.timer_tnt
# ИСПРАВЛЕНО: уровень определяется явно, позиция выравнивается по сетке блока,
# запоминается владелец для зачёта убийств игроку.
scoreboard players set #tt_hours nuke.settings 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set #tt_hours nuke.settings 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set #tt_hours nuke.settings 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set #tt_hours nuke.settings 4

scoreboard players set #tt_pid nuke.settings 0
execute as @p[distance=..12] run function nuke:util/assign_pid
execute if entity @p[distance=..12] run scoreboard players operation #tt_pid nuke.settings = @p[distance=..12] nuke.pid

execute align xyz run function nuke:timer_tnt/place
