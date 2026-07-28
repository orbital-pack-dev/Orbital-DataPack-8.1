# Каждый блок-половина защищённого сундука имеет собственный маркер состояния.
execute as @e[type=minecraft:marker,tag=ms_safe_box] at @s run function mosseater:safe/tick_one
