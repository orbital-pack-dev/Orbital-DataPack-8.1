# Установка Таймер-ТНТ строго по сетке блока. Контекст: позиция = угол блока, @s = предмет.
# Валидация спавна: место должно быть свободным, снизу обязательна твёрдая опора.
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute if block ~ ~-1 ~ #minecraft:replaceable run return fail

tag @s add tt_init

# Барьер даёт полноценную коллизию: внутрь Таймер-ТНТ больше не зайти.
setblock ~ ~ ~ minecraft:barrier replace

summon minecraft:block_display ~ ~ ~ {Tags:["tt_display","tt_new"],teleport_duration:0,block_state:{Name:"minecraft:tnt"}}
summon minecraft:text_display ~0.5 ~1.35 ~0.5 {Tags:["tt_text","tt_new"],billboard:"center",alignment:"center",see_through:false,text:{"text":"","color":"red","bold":true}}

scoreboard players operation @e[type=block_display,tag=tt_new,limit=1,distance=..2] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[type=block_display,tag=tt_new,limit=1,distance=..2] nuke.pid = #tt_pid nuke.settings

scoreboard players operation #tt_scale nuke.settings = nuke.cfg.tt_scale nuke.settings
execute if score #tt_scale nuke.settings matches ..0 run scoreboard players set #tt_scale nuke.settings 1200
scoreboard players operation @e[type=block_display,tag=tt_new,limit=1,distance=..2] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[type=block_display,tag=tt_new,limit=1,distance=..2] tt_timer *= #tt_scale nuke.settings

tag @e[tag=tt_new,distance=..2] remove tt_new
playsound minecraft:block.note_block.pling block @a ~0.5 ~0.5 ~0.5 1 1.6
kill @s
