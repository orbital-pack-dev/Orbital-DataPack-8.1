# Трёхсекундное окно: снимаем shield и разрешаем владельцу безопасный демонтаж.
scoreboard players set @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] mosseater.safe_data 60
scoreboard players set @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] mosseater.safe_auth 60
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..0.75,type=minecraft:interaction]
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35
data modify storage mosseater:safe fx set value {id:"minecraft:wax_off",speed:0.02,count:7}
execute as @e[tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx with storage mosseater:safe fx
data remove storage mosseater:safe fx
kill @s
