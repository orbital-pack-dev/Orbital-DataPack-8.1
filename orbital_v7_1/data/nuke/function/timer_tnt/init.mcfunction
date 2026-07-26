# ТАЙМЕР-ТНТ — обнаружение лежащего на земле предмета.
# Контекст: as <item>, at @s.

# Уровень заряда (1..4 часа).
scoreboard players set #tt_hours nuke.settings 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set #tt_hours nuke.settings 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set #tt_hours nuke.settings 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set #tt_hours nuke.settings 4

# Владелец заряда — ближайший игрок в момент взведения.
scoreboard players set #tt_pid nuke.settings 0
execute as @p[distance=..12] run function nuke:util/assign_pid
execute if entity @p[distance=..12] run scoreboard players operation #tt_pid nuke.settings = @p[distance=..12] nuke.pid

# Выравнивание по сетке блоков — именно из-за его отсутствия текст и частицы
# висели в воздухе со случайным смещением (позиция предмета дробная).
execute align xyz run function nuke:timer_tnt/place
