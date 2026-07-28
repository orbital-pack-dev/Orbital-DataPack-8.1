# Точка входа: reward-функция advancement mosseater:safe_hurt.
advancement revoke @s only mosseater:safe_hurt

tag @s add ms_safe_user
execute at @s as @e[type=interaction,tag=ms_safe_shield,distance=..6,sort=nearest,limit=1] at @s run function mosseater:safe/interact_entity
tag @s remove ms_safe_user
