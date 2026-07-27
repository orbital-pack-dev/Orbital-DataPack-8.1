# Context: block corner of the newly placed Safe.
# IMPORTANT: reject an adjacent placement before creating or touching markers.
# Existing safe_box markers are never killed here.
function nuke:safe/break_neighbors
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return fail

# Marker and setup interaction are exactly at block centre.
summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["safe_box","safe_unconfigured"]}
summon minecraft:interaction ~0.5 ~ ~0.5 {Tags:["safe_shield","safe_setup"],width:1.0f,height:1.0f,response:1b}
dialog show @a[tag=safe_user,limit=1] nuke:safe_setup
