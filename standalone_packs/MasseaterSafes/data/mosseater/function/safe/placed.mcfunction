# Основная мгновенная точка входа: minecraft:placed_block + match_tool.
# Reward выполняется as <игрок>; at @s задаём явно, чтобы локальные координаты
# луча никогда не наследовали чужой execution context.
advancement revoke @s only mosseater:safe_placed
tag @s remove ms_safe_place_pending
tag @s add ms_safe_user
scoreboard players set @s mosseater.safe_data 40
execute at @s anchored eyes positioned ^ ^ ^ run function mosseater:safe/raycast_loop
tag @s remove ms_safe_user
