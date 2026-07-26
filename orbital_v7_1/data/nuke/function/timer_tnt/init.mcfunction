# Инициализация установленного Таймер-ТНТ
tag @s add tt_init
execute if data entity @s Item.components."minecraft:custom_data".timer_tnt run scoreboard players set @s tt_hours 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set @s tt_hours 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set @s tt_hours 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set @s tt_hours 4

scoreboard players operation @s tt_timer = @s tt_hours
scoreboard players operation #tt_scale nuke.settings = nuke.cfg.tt_scale nuke.settings
execute if score #tt_scale nuke.settings matches ..0 run scoreboard players set #tt_scale nuke.settings 1200
scoreboard players operation @s tt_timer *= #tt_scale nuke.settings

# Сохраняем таймер во временную переменную для передачи
scoreboard players operation #tt_temp nuke.settings = @s tt_timer

playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 1.2

summon block_display ~ ~0.5 ~ {Tags:["tt_display","tt_new"],block_state:{Name:"minecraft:tnt"}}
summon text_display ~ ~1.7 ~ {Tags:["tt_text"],billboard:"center",text:{text:"",extra:[{text:"💣 "},{score:{name:"@e[type=block_display,tag=tt_display,distance=..1,limit=1]",objective:"tt_seconds"}},{text:" сек"}],color:"red",bold:1b}}

# Передаём таймер в block_display
scoreboard players operation @e[type=block_display,tag=tt_new,distance=..1,limit=1] tt_timer = #tt_temp nuke.settings
tag @e[type=block_display,tag=tt_new] remove tt_new

kill @s
