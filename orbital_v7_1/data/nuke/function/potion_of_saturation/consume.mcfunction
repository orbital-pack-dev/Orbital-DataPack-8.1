# Выполняется as игрок (награда достижения выпивания)
# По ТЗ Пакета №3: инверсия — Регенерация 3600 тиков, Насыщение 240 тиков.
# Эффекты выдаются НАПРЯМУЮ командой effect give — это гарантирует
# наложение даже если potion_contents был сбит или зелье выдано старой версией.
effect give @s minecraft:regeneration 180 0 true
effect give @s minecraft:saturation 12 0 true

# Короткие пульсирующие импульсы насыщения на протяжении 240 тиков:
# ванильный saturation съедается тиками голода, поэтому его подталкиваем.
scoreboard players set @s sat_pulse 240

particle minecraft:heart ~ ~1 ~ 0.4 0.4 0.4 8 0.01
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.6 1.6
title @s actionbar [{"text":"Зелье Сытости: ","color":"gold","bold":true},{"text":"Регенерация 3 мин / Насыщение 12 сек","color":"gray","bold":false}]
