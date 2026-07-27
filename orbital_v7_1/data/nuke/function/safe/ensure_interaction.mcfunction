# Context: Safe marker at block centre.
# Keep an existing guard exactly at the single-block centre or double-chest midpoint (lowered by 0.1).
execute if block ~ ~ ~ minecraft:chest[type=single] align xyz positioned ~0.5 ~-0.1 ~0.5 as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] positioned ~0.5 ~-0.1 ~ as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] positioned ~-0.5 ~-0.1 ~ as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] positioned ~-0.5 ~-0.1 ~ as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] positioned ~0.5 ~-0.1 ~ as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] positioned ~ ~-0.1 ~0.5 as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] positioned ~ ~-0.1 ~-0.5 as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] positioned ~ ~-0.1 ~-0.5 as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] positioned ~ ~-0.1 ~0.5 as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run tp @s ~ ~ ~

# Габариты: одиночный сундук 1.2×1.2, большой сундук 2.2×2.2 — низ блока перекрыт полностью.
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run data merge entity @s {width:1.2f,height:1.2f}
execute unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1,sort=nearest] run data merge entity @s {width:2.2f,height:2.2f}
execute unless entity @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3,limit=1] run function nuke:safe/spawn_guard
