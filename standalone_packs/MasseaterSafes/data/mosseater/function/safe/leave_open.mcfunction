# keep_open сохраняется в NBT обеих половин; lock снимается навсегда.
execute as @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] at @s run function mosseater:safe/set_keep_open_marker

# Окно доступа 100 тиков, чтобы владелец сразу открыл сундук без хитбокса.
scoreboard players set @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] mosseater.safe_data 100
execute as @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]

playsound minecraft:block.iron_door.open block @a[distance=..12] ~ ~ ~ 0.8 1.25
execute at @e[tag=ms_safe_box,distance=..1.5,sort=nearest,limit=1,type=minecraft:marker] align xyz run particle minecraft:wax_off ~0.5 ~0.8 ~0.5 0.35 0.25 0.35 0.02 8 normal @a[distance=..32]
kill @s
