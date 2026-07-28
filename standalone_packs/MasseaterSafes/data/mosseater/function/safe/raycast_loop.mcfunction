# Контекст: as <игрок>, positioned <текущая точка луча>.
scoreboard players remove @s mosseater.safe_data 1

execute if block ~ ~ ~ #minecraft:all_signs run return fail
execute if block ~ ~ ~ minecraft:chest unless entity @e[type=interaction,tag=ms_safe_shield,distance=..1.5,limit=1] run return run function mosseater:safe/found
execute if block ~ ~ ~ minecraft:trapped_chest unless entity @e[type=interaction,tag=ms_safe_shield,distance=..1.5,limit=1] run return run function mosseater:safe/found

# Луч упёрся в сундук, который уже защищён -> выходим.
execute if block ~ ~ ~ minecraft:chest run return fail
execute if block ~ ~ ~ minecraft:trapped_chest run return fail

execute if score @s mosseater.safe_data matches 1.. positioned ^ ^ ^0.25 if entity @s[distance=..6] run function mosseater:safe/raycast_loop
