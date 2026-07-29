# Контекст: as/at marker незавершённого сейфа. Ломается только вторая половина.
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~1 ~ ~ run return run function mosseater:safe/break_unconfigured_at
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-1 ~ ~ run return run function mosseater:safe/break_unconfigured_at
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-1 ~ ~ run return run function mosseater:safe/break_unconfigured_at
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~1 ~ ~ run return run function mosseater:safe/break_unconfigured_at
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~ ~1 run return run function mosseater:safe/break_unconfigured_at
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~ ~-1 run return run function mosseater:safe/break_unconfigured_at
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~ ~-1 run return run function mosseater:safe/break_unconfigured_at
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~ ~1 run return run function mosseater:safe/break_unconfigured_at
