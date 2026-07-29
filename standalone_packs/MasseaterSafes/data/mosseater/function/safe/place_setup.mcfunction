# Setup использует тот же единый owner-center manager без oversized hitbox.
function mosseater:safe/cleanup_before_spawn
execute if block ~ ~ ~ minecraft:chest[type=single] positioned ~ ~-0.2 ~ run function mosseater:safe/spawn_setup_single
execute if block ~ ~ ~ minecraft:trapped_chest positioned ~ ~-0.2 ~ run function mosseater:safe/spawn_setup_single
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.2 ~ run function mosseater:safe/spawn_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.2 ~ run function mosseater:safe/spawn_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.2 ~ run function mosseater:safe/spawn_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.2 ~ run function mosseater:safe/spawn_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~-0.2 ~0.5 run function mosseater:safe/spawn_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~-0.2 ~-0.5 run function mosseater:safe/spawn_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~-0.2 ~-0.5 run function mosseater:safe/spawn_setup_double
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~-0.2 ~0.5 run function mosseater:safe/spawn_setup_double
