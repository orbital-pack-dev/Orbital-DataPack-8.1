# Called with storage nuke:safe key, where key.pw is the chosen key name.
kill @e[type=minecraft:marker,tag=safe_box,distance=..0.8]
$data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",components:{"minecraft:custom_name":'$(pw)'},predicates:{"minecraft:custom_data":{nuke_key_active:1b}}}
$summon minecraft:marker ~ ~ ~ {Tags:["safe_box"],data:{pw:'$(pw)'}}
function nuke:safe/break_neighbors
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 1
