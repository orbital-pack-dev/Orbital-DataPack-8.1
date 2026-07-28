# Контекст: угол только что поставленного безопасного сундука.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return fail

# Если новый блок присоединился к уже защищённой половине — наследуем её состояние.
execute positioned ~0.5 ~ ~0.5 if entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..1.1,limit=1] as @e[type=minecraft:marker,tag=ms_safe_box,distance=..1.1,sort=nearest,limit=1] at @s run return run function mosseater:safe/sync_double

# Новый одинарный сейф ИЛИ конструкция «обычный сундук + поставленный сейф»:
# обе половины переводятся в единое состояние настройки.
execute positioned ~0.5 ~ ~0.5 run function mosseater:safe/init_new
