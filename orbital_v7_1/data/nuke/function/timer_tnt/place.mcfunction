# ВЗВОД ЗАРЯДА. Контекст: центр блока.
# НИ ОДНОГО setblock minecraft:tnt — именно он давал дюп-башню:
# блок выталкивал предмет вверх, предмет взводился снова и так бесконечно.
# Визуал — только block_display. Все сущности сразу помечены tt_init.
execute unless score #tt_scale nuke.settings matches 1.. run scoreboard players set #tt_scale nuke.settings 1200
execute unless score #20 nuke.settings matches 1.. run scoreboard players set #20 nuke.settings 20

summon minecraft:block_display ~-0.5 ~-0.5 ~-0.5 {Tags:["tt_display","tt_init","tt_new"],block_state:{Name:"minecraft:tnt"}}
summon minecraft:marker ~ ~ ~ {Tags:["tt_marker","tt_init","tt_new"]}
summon minecraft:text_display ~ ~0.9 ~ {Tags:["tt_text","tt_init","tt_new"],billboard:"center",see_through:1b,text:[{text:"ТАЙМЕР-ТНТ",color:"red",bold:true}]}

scoreboard players operation @e[tag=tt_new,distance=..3] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..3] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..3] tt_timer *= #tt_scale nuke.settings
tag @e[tag=tt_new,distance=..3] remove tt_new

playsound minecraft:block.note_block.bell block @a[distance=..24] ~ ~ ~ 1 0.8
