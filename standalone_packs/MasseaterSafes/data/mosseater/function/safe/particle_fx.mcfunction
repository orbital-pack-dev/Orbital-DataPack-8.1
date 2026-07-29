# Унифицированный центр частиц: один блок или геометрический центр double chest.
execute if block ~ ~ ~ minecraft:chest[type=single] align xyz positioned ~0.5 ~0.5 ~0.5 run function mosseater:safe/particle_emit_single with storage mosseater:safe fx
execute if block ~ ~ ~ minecraft:trapped_chest align xyz positioned ~0.5 ~0.5 ~0.5 run function mosseater:safe/particle_emit_single with storage mosseater:safe fx

execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] align xyz positioned ~1.0 ~0.5 ~0.5 run function mosseater:safe/particle_emit_x with storage mosseater:safe fx
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] align xyz positioned ~0.0 ~0.5 ~0.5 run function mosseater:safe/particle_emit_x with storage mosseater:safe fx
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] align xyz positioned ~0.0 ~0.5 ~0.5 run function mosseater:safe/particle_emit_x with storage mosseater:safe fx
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] align xyz positioned ~1.0 ~0.5 ~0.5 run function mosseater:safe/particle_emit_x with storage mosseater:safe fx

execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] align xyz positioned ~0.5 ~0.5 ~1.0 run function mosseater:safe/particle_emit_z with storage mosseater:safe fx
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] align xyz positioned ~0.5 ~0.5 ~0.0 run function mosseater:safe/particle_emit_z with storage mosseater:safe fx
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] align xyz positioned ~0.5 ~0.5 ~0.0 run function mosseater:safe/particle_emit_z with storage mosseater:safe fx
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] align xyz positioned ~0.5 ~0.5 ~1.0 run function mosseater:safe/particle_emit_z with storage mosseater:safe fx
