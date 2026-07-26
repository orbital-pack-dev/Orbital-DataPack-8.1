# Выпито Зелье Сытости.
advancement revoke @s only nuke:consume_potion_of_saturation

playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.2
playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 1.5
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1.0 0.5 0.1 60 normal
particle minecraft:end_rod ~ ~1 ~ 0.5 0.5 0.5 0.05 25 normal
title @s actionbar {"text":"Золотая Энергия Сытости: 3 минуты","color":"gold","bold":true}

# ИСПРАВЛЕНО: тайминги были перепутаны — оба эффекта висели по 180 секунд.
# Строго по ТЗ: Сытость 3600 тиков (180 сек), Регенерация 240 тиков (12 сек).
effect give @s minecraft:saturation 180 0 true
effect give @s minecraft:regeneration 12 0 true
