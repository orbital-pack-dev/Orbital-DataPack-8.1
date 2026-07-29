# Отложенный fallback placement scan. Контекст: as/at <игрок>.
tag @s add ms_safe_user
scoreboard players set @s mosseater.safe_data 40
execute anchored eyes positioned ^ ^ ^ run function mosseater:safe/raycast_loop
tag @s remove ms_safe_user
tag @s remove ms_safe_place_pending
