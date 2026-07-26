# Контекст: as <happy_ghast с зарядами>, at @s.
# Раньше здесь был limit=1, и второй/третий прицеп отставали и висли в воздухе.
tp @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..12] ~ ~2.4 ~
particle minecraft:smoke ~ ~2.4 ~ 0.4 0.2 0.4 3 0.01

function nuke:happy_ghast/consume_item

# Перегрузка: больше 4 зарядов Гаст не держит.
execute if score @s ghast_tnt matches 5.. run function nuke:happy_ghast/detonate
