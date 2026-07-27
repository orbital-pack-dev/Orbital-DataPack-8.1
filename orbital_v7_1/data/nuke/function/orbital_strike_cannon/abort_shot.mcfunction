# ЗАДАЧА 1 — СБРОС ПОПЫТКИ ВЫСТРЕЛА.
# Контекст: as <block_display выстрела>, at @s. Вызывается, когда
# #orbital_enabled nuke.config = 0: тиковая логика выстрела не выполняется,
# а сама попытка полностью снимается (никаких висящих сущностей и таймеров).
kill @e[type=minecraft:area_effect_cloud,tag=stabshot_owner,distance=..1]
kill @e[type=minecraft:area_effect_cloud,tag=nukeshot_owner,distance=..1]
kill @e[type=minecraft:area_effect_cloud,tag=withershot_owner,distance=..1]
scoreboard players reset @s stabshot_timer
scoreboard players reset @s nukeshot_timer
scoreboard players reset @s withershot_timer
kill @s
