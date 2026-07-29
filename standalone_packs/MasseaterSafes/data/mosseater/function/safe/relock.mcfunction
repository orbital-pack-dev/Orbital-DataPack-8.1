function mosseater:safe/apply_marker_lock
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 1.0
execute align xyz run particle minecraft:smoke ~0.5 ~0.5 ~0.5 0.25 0.2 0.25 0.01 5 normal @a[distance=..32]
