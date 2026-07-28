# Точка входа: reward-функция advancement mosseater:safe_placed.
# Контекст: as <игрок>, at <игрок>.
advancement revoke @s only mosseater:safe_placed

tag @s add ms_safe_user

# Жёсткий лимит шагов рейкаста — защита от рекурсии и от спама постановкой блоков.
scoreboard players set @s mosseater.safe_data 40

execute anchored eyes positioned ^ ^ ^ run function mosseater:safe/raycast_loop

tag @s remove ms_safe_user
