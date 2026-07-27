# Context: block corner of the newly placed Safe.
# Marker and setup interaction are exactly at block centre.
kill @e[type=minecraft:marker,tag=safe_box,distance=..1.0]
summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["safe_box","safe_unconfigured"]}
function nuke:safe/break_neighbors
summon minecraft:interaction ~0.5 ~ ~0.5 {Tags:["safe_shield","safe_setup"],width:1.0f,height:1.0f,response:1b}
dialog show @a[tag=safe_user,limit=1] nuke:safe_setup
