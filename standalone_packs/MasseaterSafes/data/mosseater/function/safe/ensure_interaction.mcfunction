# Контекст: as <marker>, at <центр его блока>.
# Создание разрешено только если рядом действительно нет guard.
execute unless entity @e[tag=ms_safe_guard,distance=..0.8,limit=1,type=minecraft:interaction] run function mosseater:safe/place

# Дедупликация не перемещает и не пересоздаёт выбранную сущность. Геометрия
# 0.98x0.88 (single) / 1.98x0.88 (double) остаётся неизменной.
tag @e[tag=ms_safe_guard_keep,distance=..0.8,type=minecraft:interaction] remove ms_safe_guard_keep
tag @e[tag=ms_safe_guard,distance=..0.8,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_guard_keep
kill @e[tag=ms_safe_guard,tag=!ms_safe_guard_keep,distance=..0.8,type=minecraft:interaction]
tag @e[tag=ms_safe_guard_keep,distance=..0.8,type=minecraft:interaction] remove ms_safe_guard_keep
