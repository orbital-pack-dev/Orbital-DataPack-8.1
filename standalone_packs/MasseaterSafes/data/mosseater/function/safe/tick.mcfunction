# interaction.player появляется после ПКМ и обрабатывается ровно один раз.
execute as @e[tag=ms_safe_shield,nbt={interaction:{}},type=minecraft:interaction] at @s run function mosseater:safe/on_interact

# МОДУЛЬ 2. Пересчёт плотности склада раз в 60 тиков, а не каждый тик.
scoreboard players remove #density_timer mosseater.safe_config 1
execute if score #density_timer mosseater.safe_config matches ..0 run function mosseater:safe/density_pass

# Каждый блок-половина имеет собственный marker состояния.
execute as @e[tag=ms_safe_box,type=minecraft:marker] at @s run function mosseater:safe/tick_one
