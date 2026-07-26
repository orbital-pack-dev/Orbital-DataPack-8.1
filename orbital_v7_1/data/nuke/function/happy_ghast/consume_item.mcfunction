# Контекст: as <happy_ghast>, at @s.
# Гаст сам заглатывает брошенный рядом ТНТ. Логика больше не дублирует attach_tnt.
execute if score @s ghast_tnt matches 4.. run return 0
execute as @e[type=minecraft:item,distance=..3] at @s if data entity @s Item{id:"minecraft:tnt"} run function nuke:happy_ghast/eat_one
