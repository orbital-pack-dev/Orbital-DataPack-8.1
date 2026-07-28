# Новый сундук приклеился к уже существующему сейфу.
# Контекст: at <угол блока нового сундука>. Диалог не показываем — наследуем сейф.
execute positioned ~0.5 ~ ~0.5 as @e[type=minecraft:marker,tag=ms_safe_box,distance=..1.6,sort=nearest,limit=1] at @s run function mosseater:safe/adopt_merge
