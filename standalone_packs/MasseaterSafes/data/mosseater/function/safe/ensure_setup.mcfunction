# После hard-block расширения setup обычно single; double оставлен для миграции.
execute if block ~ ~ ~ minecraft:chest[type=single] positioned ~ ~-0.2 ~ run return run function mosseater:safe/manage_setup_single
execute if block ~ ~ ~ minecraft:trapped_chest positioned ~ ~-0.2 ~ run return run function mosseater:safe/manage_setup_single
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.2 ~ run return run function mosseater:safe/manage_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.2 ~ run return run function mosseater:safe/manage_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.2 ~ run return run function mosseater:safe/manage_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.2 ~ run return run function mosseater:safe/manage_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~-0.2 ~0.5 run return run function mosseater:safe/manage_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~-0.2 ~-0.5 run return run function mosseater:safe/manage_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~-0.2 ~-0.5 run return run function mosseater:safe/manage_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~-0.2 ~0.5 run return run function mosseater:safe/manage_setup_double
