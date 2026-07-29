function mosseater:safe/apply_marker_lock
scoreboard players set @s mosseater.safe_data 60
kill @e[tag=ms_safe_shield,distance=..0.75,type=minecraft:interaction]
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 1.0
data modify storage mosseater:safe fx set value {id:"minecraft:smoke",speed:0.01,count:5}
function mosseater:safe/particle_fx with storage mosseater:safe fx
data remove storage mosseater:safe fx
