# Сброс триггера ачивмента для повторного срабатывания
advancement revoke @s only nuke:consume_potion_of_saturation
# Звуковые и визуальные эффекты при выпивании Зелья Сытости
playsound entity.player.levelup player @a ~ ~ ~ 1 1.2
playsound block.enchantment_table.use player @a ~ ~ ~ 1 1.5
particle totem_of_undying ~ ~1 ~ 0.5 1.0 0.5 0.1 60 normal
particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.05 25 normal
title @s actionbar {"text":"✨ Золотая Энергия Сытости наполняет вас на 3 минуты!","color":"gold","bold":true}
# Наложение эффектов Сытости и Регенерации
effect give @s minecraft:saturation 180 0 true
effect give @s minecraft:regeneration 180 0 true
