advancement revoke @s only mosseater:safe_hurt
tag @s add ms_safe_user
execute at @s as @e[tag=ms_safe_shield,distance=..6,sort=nearest,limit=1,type=minecraft:interaction] at @s run function mosseater:safe/interact_entity
tag @s remove ms_safe_user
