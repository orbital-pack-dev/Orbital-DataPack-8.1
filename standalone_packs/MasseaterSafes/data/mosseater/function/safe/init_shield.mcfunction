# Контекст: угол только что поставленного безопасного сундука.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return fail

# Наследование разрешено ТОЛЬКО если новый блок действительно стал половиной
# double chest. Маркеры этажом выше/ниже не могут перехватить инициализацию.
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] positioned ~0.5 ~ ~0.5 if entity @e[tag=ms_safe_box,distance=..1.1,limit=1,type=minecraft:marker] as @e[tag=ms_safe_box,distance=..1.1,sort=nearest,limit=1,type=minecraft:marker] at @s run return run function mosseater:safe/sync_double

# Single, вертикальный склад или отдельная соседняя конструкция — новый сейф.
execute positioned ~0.5 ~ ~0.5 run function mosseater:safe/init_new
