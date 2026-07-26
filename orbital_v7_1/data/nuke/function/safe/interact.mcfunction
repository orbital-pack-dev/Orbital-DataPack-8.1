advancement revoke @s only nuke:safe_interact
execute as @e[type=interaction,tag=safe_shield,distance=..6,sort=nearest,limit=1] run function nuke:safe/interact_entity
