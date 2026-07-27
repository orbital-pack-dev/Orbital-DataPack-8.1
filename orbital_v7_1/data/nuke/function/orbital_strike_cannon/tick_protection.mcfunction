# Защита блоков. Раньше функция работала ВНЕ зависимости от настройки
# и гасила даже те взрывы, которые должны были сработать.
# Теперь: если защита включена (1), НИ ОДИН заряд датапака не рвёт блоки:
# сущность ТНТ сносится до взрыва, а урон по сущностям выдаётся вручную
# с указанием игрока-источника, чтобы сервер засчитал убийство и лут.
#
# ЗАДАЧА 1.4: под защиту попадают ВСЕ заряды датапака — не только nuke_boom,
# но и Таймер-ТНТ (tt_boom) и финальный взрыв Fire-Shot (fs_boom).
execute if score block_protection nuke.settings matches 1 as @e[type=minecraft:tnt,tag=nuke_boom] at @s run function nuke:orbital_strike_cannon/safe_tnt
execute if score block_protection nuke.settings matches 1 as @e[type=minecraft:tnt,tag=tt_boom] at @s run function nuke:orbital_strike_cannon/safe_tnt
execute if score block_protection nuke.settings matches 1 as @e[type=minecraft:tnt,tag=fs_boom] at @s run function nuke:orbital_strike_cannon/safe_tnt
