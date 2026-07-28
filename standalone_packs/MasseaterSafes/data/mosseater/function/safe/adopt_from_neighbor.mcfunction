# Совместимый вход старой архитектуры.
execute positioned ~0.5 ~ ~0.5 as @e[type=minecraft:marker,tag=ms_safe_box,distance=..1.1,sort=nearest,limit=1] at @s run function mosseater:safe/sync_double
