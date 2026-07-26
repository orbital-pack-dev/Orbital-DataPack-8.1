# ЗЕЛЬЕ СЫТОСТИ — выпито. Контекст: as <игрок>, at @s.
# Никаких пульсаций: два чистых эффекта одной командой каждый.
# Регенерация: 180 сек = 3600 тиков (2 минуты игрового времени по ТЗ).
# Насыщение: 12 сек = 240 тиков, amplifier 1 — полоска голода заполняется гарантированно.
effect give @s minecraft:regeneration 180 0 true
effect give @s minecraft:saturation 12 1 true

playsound minecraft:entity.player.burp master @s ~ ~ ~ 1 1
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.6 1.6
particle minecraft:heart ~ ~1 ~ 0.4 0.5 0.4 8 0.01
particle minecraft:happy_villager ~ ~1 ~ 0.4 0.5 0.4 12 0.02

tellraw @s ["",{"text":"[ЗЕЛЬЕ СЫТОСТИ] ","color":"gold","bold":true},{"text":"Регенерация 3 мин и Насыщение 12 сек наложены.","color":"yellow"}]
