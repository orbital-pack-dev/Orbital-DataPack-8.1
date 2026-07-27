# Установка заряда. НИКАКИХ армор-стендов и макросов.
# Хитбокс даёт НАСТОЯЩИЙ блок minecraft:tnt — сквозь него не пройти.
execute unless score #tt_scale nuke.settings matches 1.. run scoreboard players set #tt_scale nuke.settings 1200
execute unless score #20 nuke.settings matches 1.. run scoreboard players set #20 nuke.settings 20

setblock ~ ~ ~ minecraft:tnt replace
summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags:["tt_marker","tt_new"]}
summon minecraft:text_display ~0.5 ~1.4 ~0.5 {Tags:["tt_text","tt_new"],billboard:"center",see_through:1b,text:[{text:"ТАЙМЕР-ТНТ: ",color:"red",bold:true},{score:{name:"@s",objective:"tt_seconds"},color:"yellow",bold:true},{text:" сек",color:"red",bold:true}]}

scoreboard players operation @e[tag=tt_new,distance=..3] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..3] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..3] tt_timer *= #tt_scale nuke.settings
tag @e[tag=tt_new,distance=..3] remove tt_new

playsound minecraft:block.note_block.bell block @a[distance=..24] ~ ~ ~ 1 0.8
