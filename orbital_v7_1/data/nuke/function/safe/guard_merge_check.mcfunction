# Позиция = найденный сундук. @s = игрок.
# Если сундук не половина двойного — всё в порядке.
execute unless block ~ ~ ~ minecraft:chest[type=left] unless block ~ ~ ~ minecraft:chest[type=right] run return 0

# Если найденный сундук сам заперт — значит лишний именно соседний, его и ищем.
execute if data block ~ ~ ~ components."minecraft:lock" run return 0

# Незапертая половина, приклеившаяся к сейфу — отменяем установку.
execute if data block ~1 ~ ~ components."minecraft:lock" run return run function nuke:safe/guard_merge_cancel
execute if data block ~-1 ~ ~ components."minecraft:lock" run return run function nuke:safe/guard_merge_cancel
execute if data block ~ ~ ~1 components."minecraft:lock" run return run function nuke:safe/guard_merge_cancel
execute if data block ~ ~ ~-1 components."minecraft:lock" run return run function nuke:safe/guard_merge_cancel
