# Reward выполняется as player, поставившего обычный сундук.
advancement revoke @s only mosseater:chest_placed
tag @s add ms_safe_merge_user

# КРИТИЧНО: unconfigured marker никогда не передаётся в sync_double.
execute as @e[tag=ms_safe_box,tag=ms_safe_unconfigured,distance=..8,type=minecraft:marker] at @s if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/break_unconfigured_partner
execute as @e[tag=ms_safe_box,tag=ms_safe_configured,distance=..8,type=minecraft:marker] at @s if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double

tag @s remove ms_safe_merge_user
