# Установка заряда. Контекст: as <предмет>, at @s.
# АРМОР-СТЕНДОВ БОЛЬШЕ НЕТ.

# В воде заряд не взводится — именно это делает смыв водой рабочим.
execute if block ~ ~ ~ minecraft:water run return 0
execute if block ~ ~ ~ minecraft:bubble_column run return 0
execute unless block ~ ~ ~ #minecraft:replaceable run return 0
execute if block ~ ~-1 ~ #minecraft:replaceable run return 0

execute unless score #tt_scale nuke.settings matches 1.. run scoreboard players set #tt_scale nuke.settings 1200
execute unless score #20 nuke.settings matches 1.. run scoreboard players set #20 nuke.settings 20

# Визуал блока.
summon minecraft:block_display ~ ~ ~ {Tags:["tt_display","tt_new"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}

# ТЕКСТ ВРЕМЕНИ — отдельный text_display ровно над блоком.
# Текст сам тянет свой собственный счёт tt_seconds — макросы не нужны.
summon minecraft:text_display ~0.5 ~1.2 ~0.5 {Tags:["tt_text","tt_new"],billboard:"center",see_through:1b,background:1073741824,text:[{text:"ТАЙМЕР-ТНТ: ",color:"red",bold:true},{score:{name:"@s",objective:"tt_seconds"},color:"yellow",bold:true},{text:" сек",color:"red",bold:true}]}

# Точка звука и частиц.
summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags:["tt_marker","tt_new"]}

# Хитбокс для кликов/ударов по заряду.
summon minecraft:interaction ~0.5 ~ ~0.5 {Tags:["tt_hitbox","tt_new"],width:1.0f,height:1.0f,response:1b}

scoreboard players operation @e[tag=tt_new,distance=..3] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..3] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..3] tt_timer *= #tt_scale nuke.settings
tag @e[tag=tt_new,distance=..3] remove tt_new

playsound minecraft:block.note_block.bell block @a[distance=..24] ~ ~ ~ 1 0.8
particle minecraft:flash ~0.5 ~0.5 ~0.5 0 0 0 1 1 force

kill @s
