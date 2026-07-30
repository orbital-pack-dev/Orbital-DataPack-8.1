# МОДУЛЬ 2 — общий проход подсчёта плотности. Выполняется раз в 60 тиков.
scoreboard players set #density_timer mosseater.safe_config 60
execute as @e[tag=ms_safe_box,type=minecraft:marker] at @s run function mosseater:safe/density_scan
