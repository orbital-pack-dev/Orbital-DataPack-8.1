# БАГ 3 — защита от воронок и вагонеток.
# Контекст: as <маркер>, at <центр блока сейфа>.
#
# Компонент minecraft:lock блокирует только ручное открытие игроком: воронка,
# hopper_minecart и chest_minecart вытягивают содержимое запертого сундука в
# обход всей системы паролей. Поэтому любой контейнер-похититель, примыкающий
# к сейфу, уничтожается.
#
# Проверка выполняется не каждый тик, а по общему флагу #protect_now из
# safe/tick (раз в 10 тиков): 6 проверок блока на каждый сейф каждый тик дали
# бы заметную нагрузку на складе.

# 1. Воронки со всех шести сторон. destroy выбрасывает саму воронку и её
#    содержимое, поэтому у игрока ничего не пропадает.
execute align xyz positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~ ~1 ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~1 ~ ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~ ~ ~1 if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper

# 2. Вагонетки. Радиус 1.2 от центра блока сейфа перекрывает рельсы снизу и
#    вплотную сбоку, но не достаёт до вагонетки через блок.
execute align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[type=minecraft:hopper_minecart,distance=..1.2] run function mosseater:safe/break_minecarts
execute align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[type=minecraft:chest_minecart,distance=..1.2] run function mosseater:safe/break_minecarts
