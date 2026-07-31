# Защита от воронок и анти-локаут ключей — медленный проход, раз в 10 тиков.
# Контекст: as <маркер>, at <центр блока сейфа>.
#
# Воронка снизу здесь не проверяется: это единственный реальный вектор кражи,
# и он обрабатывается каждый тик в tick_one. Оставшиеся 5 сторон могут только
# класть предметы в сейф, поэтому их спокойно хватает медленного прохода.

# 1. Боковые и верхняя воронки. destroy выбрасывает и саму воронку, и её
#    содержимое, поэтому у игрока ничего не пропадает.
execute align xyz positioned ~ ~1 ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~1 ~ ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~ ~ ~1 if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper
execute align xyz positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:hopper run function mosseater:safe/break_hopper

# 2. Вагонетки в объёмной коробке — страховка на случай, если вагонетка
#    появилась в чанке без тика сущностей. Основную работу делает purge_cart.
#    dy=2 покрывает два блока под сейфом, чего сфера раньше не делала.
execute align xyz positioned ~-1 ~-2 ~-1 if entity @e[type=minecraft:hopper_minecart,dx=2,dy=3,dz=2] run function mosseater:safe/break_minecarts
execute align xyz positioned ~-1 ~-2 ~-1 if entity @e[type=minecraft:chest_minecart,dx=2,dy=3,dz=2] run function mosseater:safe/break_minecarts

# 3. АНТИ-ЛОКАУТ. Ключ физически не может лежать внутри сейфа.
execute align xyz if data block ~ ~ ~ Items[{components:{"minecraft:custom_data":{mosseater_key_active:1b}}}] run function mosseater:safe/eject_key_active
execute align xyz if data block ~ ~ ~ Items[{components:{"minecraft:custom_data":{mosseater_master:1b}}}] run function mosseater:safe/eject_key_master
