# Контекст: as <игрок>, positioned <текущая точка луча>.
scoreboard players remove @s mosseater.safe_data 1

execute if block ~ ~ ~ #minecraft:all_signs run return fail

# Проверяем защиту СТРОГО в центре текущего блока. Маркеры/interaction этажом
# выше, ниже или в соседней горизонтальной конструкции больше не блокируют init.
execute if block ~ ~ ~ minecraft:chest align xyz positioned ~0.5 ~ ~0.5 unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run return run function mosseater:safe/found
execute if block ~ ~ ~ minecraft:trapped_chest align xyz positioned ~0.5 ~ ~0.5 unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run return run function mosseater:safe/found

# Луч упёрся именно в уже защищённый блок.
execute if block ~ ~ ~ minecraft:chest run return fail
execute if block ~ ~ ~ minecraft:trapped_chest run return fail

execute if score @s mosseater.safe_data matches 1.. positioned ^ ^ ^0.25 if entity @s[distance=..6] run function mosseater:safe/raycast_loop
