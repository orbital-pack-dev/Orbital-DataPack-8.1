function mosseater:safe/apply_marker_lock
scoreboard players set @s mosseater.safe_data 60
kill @e[tag=ms_safe_shield,distance=..0.75,type=minecraft:interaction]
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 1.0
execute align xyz run particle minecraft:smoke ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.01 5 normal @a[distance=..32]
