# Основная мгновенная точка входа: minecraft:placed_block + match_tool.
# match_tool проверяет именно использованный stack ДО его расходования, поэтому
# корректно работает даже при установке последнего предмета в слоте.
advancement revoke @s only mosseater:safe_placed

# Убираем возможную fallback-метку: основной триггер уже обработал постановку.
tag @s remove ms_safe_place_pending
tag @s add ms_safe_user
scoreboard players set @s mosseater.safe_data 40
execute anchored eyes positioned ^ ^ ^ run function mosseater:safe/raycast_loop
tag @s remove ms_safe_user
