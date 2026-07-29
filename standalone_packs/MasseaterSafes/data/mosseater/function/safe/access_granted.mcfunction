# Трёхсекундное окно: снимаем все shield сущности именно этой конструкции.
scoreboard players set @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] mosseater.safe_data 60
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..0.75,type=minecraft:interaction]
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35
execute at @e[tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] align xyz run particle minecraft:wax_off ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.02 7 normal @a[distance=..32]
kill @s
