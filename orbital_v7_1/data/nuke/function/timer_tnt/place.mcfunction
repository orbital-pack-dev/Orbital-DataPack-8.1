# Установка Таймер-ТНТ. Контекст: as <item>, positioned <угол блока>.

# Проверка валидности места: нельзя вставать внутрь твёрдого блока…
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
# …и нельзя висеть в воздухе без опоры. Предмет остаётся лежать и повторит попытку.
execute if block ~ ~-1 ~ #minecraft:replaceable run return fail

tag @s add tt_init

# Барьер даёт реальную коллизию: в Таймер-ТНТ нельзя зайти и его нельзя сломать вручную.
# Он же не даёт воде залить сам блок — вода остановится рядом и будет обнаружена.
setblock ~ ~ ~ minecraft:barrier replace

# Визуал блока ставим в УГОЛ блока (block_display растёт от угла, а не от центра).
summon minecraft:block_display ~ ~ ~ {Tags:["tt_display","tt_new"],block_state:{Name:"minecraft:tnt"}}
# Текст — ровно над центром блока.
summon minecraft:text_display ~0.5 ~1.35 ~0.5 {Tags:["tt_text","tt_new"],billboard:"center",alignment:"center",see_through:false,text:{"text":"⏲","color":"red","bold":true}}

scoreboard players operation @e[tag=tt_new,distance=..3] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..3] nuke.pid = #tt_pid nuke.settings

# Длительность одного "часа" берётся из настроек, дефолт 1200 тиков.
scoreboard players set #tt_scale nuke.settings 1200
execute if score tt_scale nuke.settings matches 1.. run scoreboard players operation #tt_scale nuke.settings = tt_scale nuke.settings
execute if score nuke.cfg.tt_scale nuke.settings matches 1.. run scoreboard players operation #tt_scale nuke.settings = nuke.cfg.tt_scale nuke.settings

scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..3] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..3] tt_timer *= #tt_scale nuke.settings

tag @e[tag=tt_new,distance=..3] remove tt_new
playsound minecraft:block.note_block.bit block @a[distance=..16] ~0.5 ~0.5 ~0.5 1 0.8
kill @s
