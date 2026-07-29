# Правильный ключ даёт 100 тиков (5 секунд) прямого доступа к блоку.
scoreboard players set @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] mosseater.safe_data 100
tag @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] add ms_safe_access_open

# Временно снимаем vanilla lock с обеих половин: после исчезновения hitbox
# следующий ПКМ гарантированно открывает контейнер.
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run data remove block ~ ~ ~ components."minecraft:lock"

playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35
execute at @e[tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] align xyz run particle minecraft:wax_off ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.02 7 normal @a[distance=..32]
title @a[tag=ms_safe_user,limit=1] actionbar {text:"Сейф открыт на 5 секунд",color:"green"}

# Удаление выполняется последним. Для верного ключа interaction исчезает сразу.
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..0.75,type=minecraft:interaction]
