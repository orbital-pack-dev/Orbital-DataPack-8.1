# Контекст: as <маркер-донор>, at <его половина double chest>.
#
# БАГ 1. Здесь нет и не может быть ни одного поиска по сфере: вторая половина
# определяется ИСКЛЮЧИТЕЛЬНО ванильным состоянием блока facing + type=left|right,
# а смещение всегда строго горизонтальное, с обязательным совпадением по Y (~).
# Сундук на Y+1 или Y-1 не является половиной double chest в ванилле, поэтому
# в эту таблицу он не попадает ни при каком расположении.
#
# Решение — усыновить половину или разорвать объединение — принимает
# check_partner: сам sync_double ничего не создаёт и не ломает.
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~ ~1 run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~ ~-1 run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~ ~-1 run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~ ~1 run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=north,type=left] positioned ~1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=north,type=right] positioned ~-1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=south,type=left] positioned ~-1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=south,type=right] positioned ~1 ~ ~ run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=east,type=left] positioned ~ ~ ~1 run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=east,type=right] positioned ~ ~ ~-1 run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=west,type=left] positioned ~ ~ ~-1 run function mosseater:safe/check_partner
execute if block ~ ~ ~ minecraft:trapped_chest[facing=west,type=right] positioned ~ ~ ~1 run function mosseater:safe/check_partner
