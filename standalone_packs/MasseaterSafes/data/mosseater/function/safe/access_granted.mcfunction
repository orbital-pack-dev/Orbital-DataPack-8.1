# На 12 тиков снимаем только защитный interaction. minecraft:lock остаётся и
# повторно проверяет тот же ItemStack predicate перед открытием GUI.
scoreboard players set @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75] mosseater.safe_data 12
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35
execute at @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1] align xyz run particle minecraft:wax_off ~0.5 ~0.5 ~0.5 0.25 0.2 0.25 0.02 7 normal @a[distance=..32]
kill @s
