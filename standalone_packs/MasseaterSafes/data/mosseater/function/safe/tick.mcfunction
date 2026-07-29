# Каждый блок-половина имеет собственный marker состояния.
# Density scan: раз в 60 тиков (3 секунды).
execute as @e[tag=ms_safe_box,type=minecraft:marker] run scoreboard players add @s mosseater.safe_scan 1
execute as @e[tag=ms_safe_box,scores={mosseater.safe_scan=60..},type=minecraft:marker] at @s run function mosseater:safe/density_scan

# Self-healing watchdog: раз в 100 тиков (5 секунд).
execute as @e[tag=ms_safe_box,type=minecraft:marker] run scoreboard players add @s mosseater.safe_watch 1
execute as @e[tag=ms_safe_box,scores={mosseater.safe_watch=100..},type=minecraft:marker] at @s run function mosseater:safe/watchdog

execute as @e[tag=ms_safe_box,type=minecraft:marker] at @s run function mosseater:safe/tick_one
