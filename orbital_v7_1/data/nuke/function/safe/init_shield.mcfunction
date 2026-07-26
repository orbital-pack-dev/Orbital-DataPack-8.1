# Convert block to single chest if it connected
setblock ~ ~ ~ chest[type=single] keep
# Summon the interaction entity slightly larger to protect the block completely
summon interaction ~ ~-0.1 ~ {Tags:["safe_shield", "safe_setup"], width:1.1f, height:1.2f, response:true}
# Ask the player to set it up
dialog show @p nuke:safe_setup
