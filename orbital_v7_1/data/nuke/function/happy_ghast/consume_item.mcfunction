# Контекст: as <Гаст любого типа>, at @s.
# Максимум 14 зарядов на одного Гаста.
execute if score @s ghast_tnt matches 14.. run return 0

# Просто: ближайший брошенный ДИНАМИТ в радиусе 6 блоков.
execute if entity @e[type=minecraft:item,distance=..6,nbt={Item:{id:"minecraft:tnt"}},limit=1] run function nuke:happy_ghast/attach_tnt
