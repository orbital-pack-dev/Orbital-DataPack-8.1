# КРИТИЧНО 2 — вагонетки-похитители.
# Контекст: as/at <hopper_minecart | chest_minecart>.
#
# Проверка идёт ОТ ВАГОНЕТКИ, а не от сейфа. Это исправляет главную ошибку
# прошлой версии: вагонетка ПОД сейфом сидит на рельсах высотой 0.06,
# то есть в 1.44 блока от центра блока сейфа, и в старый радиус 1.2 она НЕ
# ПОПАДАЛА. Радиус 1.8 покрывает и положение под сейфом (1.44), и вплотную
# сбоку (1.06), но не достаёт до рельсовой линии в двух блоках от склада.
execute unless entity @e[tag=ms_safe_box,distance=..1.8,limit=1,type=minecraft:marker] run return 0

particle minecraft:smoke ~ ~0.3 ~ 0.3 0.3 0.3 0.03 20 normal @a[distance=..32]
playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 0.8 1.0
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Вагонетки не работают с сейфом",color:"red",bold:true}
kill @s
