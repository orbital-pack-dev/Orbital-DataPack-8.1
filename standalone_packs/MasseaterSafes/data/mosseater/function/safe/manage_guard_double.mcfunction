execute unless entity @e[tag=ms_safe_guard,distance=..0.35,limit=1,type=minecraft:interaction] run function mosseater:safe/spawn_guard_double
# Одна общая сущность на обе половины.
tag @e[tag=ms_safe_entity_keep,distance=..0.35,type=minecraft:interaction] remove ms_safe_entity_keep
tag @e[tag=ms_safe_guard,distance=..0.35,sort=nearest,limit=1,type=minecraft:interaction] add ms_safe_entity_keep
kill @e[tag=!ms_safe_entity_keep,distance=..0.35,type=minecraft:interaction]
data merge entity @e[tag=ms_safe_entity_keep,distance=..0.35,limit=1,type=minecraft:interaction] {width:2.1f,height:1.4f,response:1b}
tag @e[tag=ms_safe_entity_keep,distance=..0.35,type=minecraft:interaction] remove ms_safe_entity_keep
