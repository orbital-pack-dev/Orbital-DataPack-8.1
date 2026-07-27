# Context: player at the centre of the newly placed Safe chest.
# Never replace the Safe block: setblock replace erased its Data Components.

# Create the state marker immediately, before password setup completes.
kill @e[type=minecraft:marker,tag=safe_box,distance=..0.8]
summon minecraft:marker ~ ~ ~ {Tags:["safe_box","safe_unconfigured"]}

# Destroy ordinary chests already touching the new Safe.
function nuke:safe/break_neighbors

# Interaction exists only while the password is being configured.
summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_setup"],width:1.0f,height:1.0f,response:1b}
dialog show @a[tag=safe_user,limit=1] nuke:safe_setup
