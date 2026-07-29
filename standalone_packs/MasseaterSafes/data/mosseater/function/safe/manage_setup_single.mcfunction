execute unless entity @e[tag=ms_safe_setup,distance=..0.35,limit=1,type=minecraft:interaction] unless entity @e[tag=ms_safe_awaiting_key,distance=..0.35,limit=1,type=minecraft:interaction] run function mosseater:safe/spawn_setup_single
tag @e[tag=ms_safe_entity_keep,distance=..0.35,type=minecraft:interaction] remove ms_safe_entity_keep
tag @e[tag=ms_safe_setup,distance=..0.35,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_entity_keep
tag @e[tag=ms_safe_awaiting_key,distance=..0.35,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_entity_keep
kill @e[tag=!ms_safe_entity_keep,distance=..0.35,type=minecraft:interaction]
data merge entity @e[tag=ms_safe_entity_keep,distance=..0.35,limit=1,type=minecraft:interaction] {width:1.1f,height:1.4f,response:1b}
tag @e[tag=ms_safe_entity_keep,distance=..0.35,type=minecraft:interaction] remove ms_safe_entity_keep
