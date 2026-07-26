# Точка входа: reward-функция advancement nuke:safe_interact.
# Контекст: as <игрок>, at <игрок>.
advancement revoke @s only nuke:safe_interact

tag @s add safe_user
# `at @s` обязателен: без него дальше по цепочке терялась позиция блока сундука,
# и data modify block ~ ~ ~ применялся к блоку под игроком.
execute at @s as @e[type=interaction,tag=safe_shield,distance=..6,sort=nearest,limit=1] at @s run function nuke:safe/interact_entity
tag @s remove safe_user
