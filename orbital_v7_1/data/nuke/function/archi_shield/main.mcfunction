# АРХИ-ЩИТ — основной тик. Контекст: as <игрок с Архи-Щитом в руке>, at @s.

# Кулдаун срабатывания защиты.
execute if score @s archi_delay matches 1.. run scoreboard players remove @s archi_delay 1

# 1) Защита по урону: работает и от прямого урона, и от блока щитом.
execute if score @s damage_taken matches 1.. run function nuke:archi_shield/hit_defense
execute unless score @s damage_taken matches 1.. if score @s damage_blocked_by_shield matches 1.. run function nuke:archi_shield/hit_defense

# 2) Барьер по шифту. Тики шифта считаем САМИ (dummy),
# а не через ванильную статистику — так оно работает всегда.
execute unless entity @s[predicate=nuke:is_sneaking] run scoreboard players set @s sneak_time 0
execute if entity @s[predicate=nuke:is_sneaking] run scoreboard players add @s sneak_time 1
execute if score @s sneak_time matches 1.. run function nuke:archi_shield/sneak_active

# 3) Пассивная аура (дешёвая: 2 частицы на игрока в тик) — видимый признак жизни модуля.
particle minecraft:end_rod ~ ~1 ~ 0.25 0.4 0.25 2 0.005
