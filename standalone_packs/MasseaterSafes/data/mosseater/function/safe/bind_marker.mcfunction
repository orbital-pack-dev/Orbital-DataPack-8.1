# Пересоздаём маркер сейфа и записываем в него ТОЧНУЮ копию имени ключа.
# Контекст: at <центр блока сундука>, требуется storage mosseater:safe key.pw.
kill @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8]
summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_fresh"]}
data modify entity @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.8,limit=1] data.pw set from storage mosseater:safe key.pw
tag @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.8,limit=1] remove ms_safe_fresh
