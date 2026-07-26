# Выполняется as block_display, at @s
execute store result storage nuke:tt sec int 1 run scoreboard players get @s tt_seconds
function nuke:timer_tnt/set_text with storage nuke:tt

# Дублирующий канал отображения: если текстовая сущность по любой причине
# пропала, игрок всё равно видит остаток времени рядом с зарядом.
title @a[distance=..6] actionbar [{"text":"Таймер-ТНТ: ","color":"red","bold":true},{"score":{"name":"@s","objective":"tt_seconds"},"color":"yellow"},{"text":" сек","color":"gray"}]

# Хитбокс всегда строго по центру блока, текст — ровно над ним.
tp @e[type=minecraft:armor_stand,tag=tt_hitbox,distance=..2,limit=1,sort=nearest] ~0.5 ~ ~0.5
tp @e[type=minecraft:text_display,tag=tt_text,distance=..3,limit=1,sort=nearest] ~0.5 ~1.35 ~0.5
