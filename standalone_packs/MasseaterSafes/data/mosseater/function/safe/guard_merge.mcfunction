# Любой новый обычный сундук рядом с сейфом проверяется повторно после revoke.
advancement revoke @s only mosseater:chest_placed
execute as @e[tag=ms_safe_box,distance=..8,type=minecraft:marker] at @s if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double
