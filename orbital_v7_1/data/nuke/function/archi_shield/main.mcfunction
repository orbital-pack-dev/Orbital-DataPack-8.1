# АРХИ-ЩИТ — основной тик.
# Контекст: as <игрок с Архи-Щитом в руке>, at @s.

# Кулдаун срабатывания защиты.
execute if score @s archi_delay matches 1.. run scoreboard players remove @s archi_delay 1

# Защита срабатывает и от прямого урона, и от урона, поглощённого щитом.
# unless во второй строке — чтобы за один тик защита не сработала дважды.
execute if score @s damage_taken matches 1.. run function nuke:archi_shield/hit_defense
execute unless score @s damage_taken matches 1.. if score @s damage_blocked_by_shield matches 1.. run function nuke:archi_shield/hit_defense

# Барьер по шифту. sneak_time — ванильная статистика, растёт сама, пока игрок крадётся,
# поэтому её достаточно обнулять при выходе из шифта.
execute unless entity @s[predicate=nuke:is_sneaking] run scoreboard players reset @s sneak_time
execute if entity @s[predicate=nuke:is_sneaking] run function nuke:archi_shield/sneak_active

# Пассивная аура (дешёвая: 2 частицы на игрока в тик).
particle minecraft:end_rod ~ ~1 ~ 0.25 0.4 0.25 2 0.005
