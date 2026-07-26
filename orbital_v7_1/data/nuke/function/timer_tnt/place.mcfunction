# Установка заряда. Контекст: as <предмет>, at @s.

# В воде заряд НЕ взводится (именно это делает смыв водой рабочим).
execute if block ~ ~ ~ minecraft:water run return 0
execute if block ~ ~ ~ minecraft:bubble_column run return 0

# Проверка валидности: место свободно и есть опора снизу.
execute unless block ~ ~ ~ #minecraft:replaceable run return 0
execute if block ~ ~-1 ~ #minecraft:replaceable run return 0

# Шкала времени: 1 "час" = 1200 тиков по умолчанию.
execute unless score #tt_scale nuke.settings matches 1.. run scoreboard players set #tt_scale nuke.settings 1200
execute unless score #20 nuke.settings matches 1.. run scoreboard players set #20 nuke.settings 20

# Визуал заряда.
summon minecraft:block_display ~ ~ ~ {Tags:["tt_display","tt_new"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}

# ФИЗИЧЕСКИЙ ХИТБОКС и ОДНОВРЕМЕННО табло таймера:
# обычный armor_stand без Marker и без отключения хитбокса — сквозь него не пройти.
summon minecraft:armor_stand ~0.5 ~ ~0.5 {Tags:["tt_hitbox"],Invisible:1b,Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,Silent:1b,PersistenceRequired:1b,CustomNameVisible:1b,CustomName:{text:"ТАЙМЕР-ТНТ",color:"red",bold:true}}

# Счётчики на свежем дисплее.
scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..2] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..2] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..2] tt_timer *= #tt_scale nuke.settings
tag @e[type=minecraft:block_display,tag=tt_new,distance=..2] remove tt_new

playsound minecraft:block.note_block.bell block @a[distance=..24] ~ ~ ~ 1 0.8
particle minecraft:flash ~0.5 ~0.5 ~0.5 0 0 0 1 1 force
title @a[distance=..8] actionbar {"text":"Таймер-ТНТ взведён!","color":"red","bold":true}

kill @s
