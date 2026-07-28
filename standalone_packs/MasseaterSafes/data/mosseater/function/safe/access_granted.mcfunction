# На 12 тиков снимаем только защитный interaction. minecraft:lock остаётся и
# повторно проверяет тот же ItemStack predicate перед открытием GUI.
scoreboard players set @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75] mosseater.safe_data 12
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35
particle minecraft:wax_off ~ ~0.8 ~ 0.25 0.2 0.25 7 0.02
kill @s
