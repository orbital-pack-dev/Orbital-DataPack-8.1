# Точка входа: reward-функция advancement nuke:safe_placed.
# Контекст: as <игрок>, at <игрок>.
advancement revoke @s only nuke:safe_placed

# Помечаем инициатора, чтобы ниже по цепочке вызовов не полагаться на @p
# (@p от позиции сундука может выбрать другого игрока).
tag @s add safe_user

# Жёсткий лимит шагов рейкаста — защита от бесконечной рекурсии и от
# намеренного спама постановкой блоков (зависание сервера).
scoreboard players set @s raycast_limit 40

execute anchored eyes positioned ^ ^ ^ run function nuke:safe/raycast_loop

tag @s remove safe_user
