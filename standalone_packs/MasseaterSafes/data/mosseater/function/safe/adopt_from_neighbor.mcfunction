# Совместимый вход старой архитектуры.
execute positioned ~0.5 ~ ~0.5 as @e[tag=ms_safe_box,distance=..1.1,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/sync_double
