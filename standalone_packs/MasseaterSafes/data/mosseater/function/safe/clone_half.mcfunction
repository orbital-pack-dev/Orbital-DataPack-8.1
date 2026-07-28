# Контекст: as <маркер-донор>, positioned <центр новой половины>.
data modify storage mosseater:safe transfer.safe set from entity @s data.safe
summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_fresh"]}
data modify entity @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.7,limit=1] data.safe set from storage mosseater:safe transfer.safe
execute if entity @s[tag=ms_safe_configured] run tag @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.7,limit=1] add ms_safe_configured
execute if entity @s[tag=ms_safe_keep_open] run tag @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.7,limit=1] add ms_safe_keep_open
execute if entity @s[tag=ms_safe_unconfigured] run tag @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.7,limit=1] add ms_safe_unconfigured
tag @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.7,limit=1] remove ms_safe_fresh

execute if entity @s[tag=ms_safe_configured] run function mosseater:safe/apply_marker_lock
execute if entity @s[tag=ms_safe_keep_open] run data remove block ~ ~ ~ components."minecraft:lock"
data remove storage mosseater:safe transfer
playsound minecraft:block.chest.locked block @a[distance=..12] ~ ~ ~ 0.65 1.2
particle minecraft:enchant ~ ~0.8 ~ 0.25 0.25 0.25 8 0.02
