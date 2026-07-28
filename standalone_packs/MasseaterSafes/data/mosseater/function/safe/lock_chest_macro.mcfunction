# Вызывается с storage mosseater:safe key, где key.pw — имя ключа.
kill @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.8]
$data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",components:{"minecraft:custom_name":'$(pw)'},predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
$summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box"],data:{pw:'$(pw)'}}
function mosseater:safe/break_neighbors
function mosseater:safe/ensure_interaction
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 1
