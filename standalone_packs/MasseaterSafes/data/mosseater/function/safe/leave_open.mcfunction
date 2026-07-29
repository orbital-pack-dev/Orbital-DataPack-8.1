# Контекст: as <setup interaction>, at <interaction>.
# keep_open хранится в NBT КАЖДОГО маркера конструкции и переживает merge/split/reload.
execute as @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75] at @s run function mosseater:safe/set_keep_open_marker
playsound minecraft:block.iron_door.open block @a[distance=..12] ~ ~ ~ 0.8 1.25
execute at @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1] align xyz run particle minecraft:wax_off ~0.5 ~0.5 ~0.5 0.35 0.25 0.35 0.02 8 normal @a[distance=..32]
kill @s
