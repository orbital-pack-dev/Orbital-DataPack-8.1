# Зелье Сытости. Контекст: as <игрок>, at @s.
# Было: оба эффекта по 180 секунд (тайминги перепутаны).
# ТЗ: Сытость — 3 минуты (3600 тиков), Регенерация — 12 секунд (240 тиков).
effect give @s minecraft:saturation 180 0 true
effect give @s minecraft:regeneration 12 0 true

particle minecraft:heart ~ ~1 ~ 0.4 0.4 0.4 8 0.01
playsound minecraft:entity.player.burp player @s ~ ~ ~ 1 1
tellraw @s [{"text":"[ЗЕЛЬЕ] ","color":"gold","bold":true},{"text":"Сытость 3 мин, Регенерация 12 сек.","color":"gray","bold":false}]
