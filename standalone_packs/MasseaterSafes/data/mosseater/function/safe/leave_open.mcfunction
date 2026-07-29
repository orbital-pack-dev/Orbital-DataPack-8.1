# keep_open сохраняется в NBT обеих половин; hitbox вернётся через 60 тиков.
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run function mosseater:safe/set_keep_open_marker
scoreboard players set @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] mosseater.safe_data 60
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..0.75,type=minecraft:interaction]
playsound minecraft:block.iron_door.open block @a[distance=..12] ~ ~ ~ 0.8 1.25
data modify storage mosseater:safe fx set value {id:"minecraft:wax_off",speed:0.02,count:8}
execute as @e[tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx with storage mosseater:safe fx
data remove storage mosseater:safe fx
kill @s
