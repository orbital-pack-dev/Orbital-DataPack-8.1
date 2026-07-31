# КРИТИЧНО 3 — защита сейфов от подрыва.
# Контекст: as/at <tnt | tnt_minecart>.
#
# Маркеры-перехватчики вокруг каждого сейфа сознательно НЕ спавнятся: каждая
# лишняя сущность — это постоянный расход тика и памяти на всех сейфах сразу,
# а проверка от самого ТНТ стоит ровно ноль, пока ТНТ в мире нет.
#
# Радиус 8 выбран по ванильной механике: взрыв ТНТ с power 4.0 разрушает
# блоки максимум в ~7 блоках, поэтому заряд гасится заведомо раньше.
# Собственный заряд Сундука-Мины помечен ms_safe_mine и исключён ещё на
# уровне селектора в safe/tick, иначе МОДУЛЬ 4 гасил бы сам себя.
execute unless entity @e[tag=ms_safe_box,distance=..8,limit=1,type=minecraft:marker] run return 0

particle minecraft:cloud ~ ~0.3 ~ 0.3 0.3 0.3 0.02 25 normal @a[distance=..32]
playsound minecraft:block.fire.extinguish block @a[distance=..24] ~ ~ ~ 1 1.4
title @a[distance=..12,limit=1,sort=nearest] actionbar {text:"Сейфы защищены от взрывов",color:"aqua",bold:true}
kill @s
