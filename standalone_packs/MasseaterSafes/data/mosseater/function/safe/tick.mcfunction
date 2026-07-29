# Каждый блок-половина имеет собственный marker состояния.
execute as @e[tag=ms_safe_box,type=minecraft:marker] at @s run function mosseater:safe/tick_one
