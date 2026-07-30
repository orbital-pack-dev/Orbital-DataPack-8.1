# Контекст: as <маркер-донор>, at <его половина double chest>.
# Функция обрабатывает только вторую половину текущего double chest.
# Решение о том, усыновить половину или разорвать объединение, принимает
# check_partner: сам sync_double больше ничего не создаёт и не ломает.
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
