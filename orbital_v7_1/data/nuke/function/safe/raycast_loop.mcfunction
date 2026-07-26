execute if block ~ ~ ~ chest unless entity @e[type=interaction,tag=safe_shield,distance=..1] run function nuke:safe/found
execute unless block ~ ~ ~ chest positioned ^ ^ ^0.2 if entity @s[distance=..6] run function nuke:safe/raycast_loop
