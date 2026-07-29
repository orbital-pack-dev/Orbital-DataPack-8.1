# Singleton setup manager: waiting-key имеет приоритет над обычным setup.
tag @e[tag=ms_safe_setup,distance=..1.1,type=minecraft:interaction] remove ms_safe_setup_keep
tag @e[tag=ms_safe_awaiting_key,distance=..1.1,type=minecraft:interaction] remove ms_safe_setup_keep
execute if entity @e[tag=ms_safe_awaiting_key,distance=..1.1,limit=1,type=minecraft:interaction] run tag @e[tag=ms_safe_awaiting_key,distance=..1.1,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_setup_keep
execute unless entity @e[tag=ms_safe_awaiting_key,distance=..1.1,limit=1,type=minecraft:interaction] run tag @e[tag=ms_safe_setup,distance=..1.1,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_setup_keep
kill @e[tag=ms_safe_setup,tag=!ms_safe_setup_keep,distance=..1.1,type=minecraft:interaction]
kill @e[tag=ms_safe_awaiting_key,tag=!ms_safe_setup_keep,distance=..1.1,type=minecraft:interaction]
execute unless entity @e[tag=ms_safe_setup_keep,distance=..1.1,limit=1,type=minecraft:interaction] run function mosseater:safe/place_setup
tag @e[tag=ms_safe_setup_keep,distance=..1.1,type=minecraft:interaction] remove ms_safe_setup_keep
