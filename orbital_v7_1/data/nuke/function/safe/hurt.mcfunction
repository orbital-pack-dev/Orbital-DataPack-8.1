# Точка входа: reward-функция advancement nuke:safe_hurt.
# Контекст: as <игрок>, at <игрок>.
advancement revoke @s only nuke:safe_hurt

tag @s add safe_user
execute at @s as @e[type=interaction,tag=safe_shield,distance=..6,sort=nearest,limit=1] at @s run function nuke:safe/interact_entity
tag @s remove safe_user
