# Arm exactly one charge. No primed TNT entity and no recursive function.
execute unless score #tt_scale nuke.settings matches 1.. run scoreboard players set #tt_scale nuke.settings 1200
execute unless score #20 nuke.settings matches 20 run scoreboard players set #20 nuke.settings 20
summon minecraft:block_display ~-0.5 ~-0.5 ~-0.5 {Tags:["tt_display","tt_init","tt_new"],block_state:{Name:"minecraft:tnt"},teleport_duration:0}
summon minecraft:interaction ~ ~-0.5 ~ {Tags:["tt_hitbox","tt_init","tt_new"],width:1.0f,height:1.0f,response:1b}
summon minecraft:marker ~ ~ ~ {Tags:["tt_marker","tt_init","tt_new"]}
# Marker is at block centre (Y+0.5), so +0.7 produces block Y+1.2.
summon minecraft:text_display ~ ~0.7 ~ {Tags:["tt_text","tt_init","tt_new"],billboard:"center",see_through:1b,shadow:1b,view_range:32f,text:{text:"ТАЙМЕР-ТНТ",color:"red",bold:true}}
scoreboard players operation @e[tag=tt_new,distance=..2] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..2] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..2] tt_timer *= #tt_scale nuke.settings
execute as @e[type=minecraft:marker,tag=tt_marker,tag=tt_new,distance=..2,limit=1,sort=nearest] at @s run function nuke:timer_tnt/second
tag @e[tag=tt_new,distance=..2] remove tt_new
playsound minecraft:block.note_block.bell block @a[distance=..24] ~ ~ ~ 1 0.8
