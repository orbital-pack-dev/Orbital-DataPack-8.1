# Выполняется as item, positioned в углу блока
# ВАЛИДНОСТЬ СПАВНА: не внутри твёрдого блока и только на опоре.
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute if block ~ ~-1 ~ #minecraft:replaceable run return fail

tag @s add tt_init

# Аудит-3: НИКАКОГО minecraft:barrier. Блок остаётся воздушным,
# чтобы вода могла зайти и смыть заряд. Хитбокс — невидимый
# неуязвимый armor_stand: он имеет реальную коллизию и не даёт зайти в заряд.
summon minecraft:armor_stand ~0.5 ~ ~0.5 {Tags:["tt_hitbox"],Marker:0b,Invisible:1b,Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,Silent:1b,PersistenceRequired:1b,DisabledSlots:4144959}

summon minecraft:block_display ~ ~ ~ {Tags:["tt_display","tt_new"],block_state:{Name:"minecraft:tnt"}}
summon minecraft:text_display ~0.5 ~1.35 ~0.5 {Tags:["tt_text","tt_new"],billboard:"center",alignment:"center",see_through:false,text:{"text":"...","color":"red","bold":true}}

scoreboard players operation @e[tag=tt_new,distance=..3] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..3] nuke.pid = #tt_pid nuke.settings

scoreboard players set #tt_scale nuke.settings 1200
execute if score tt_scale nuke.settings matches 1.. run scoreboard players operation #tt_scale nuke.settings = tt_scale nuke.settings
execute if score nuke.cfg.tt_scale nuke.settings matches 1.. run scoreboard players operation #tt_scale nuke.settings = nuke.cfg.tt_scale nuke.settings

scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..3] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[type=minecraft:block_display,tag=tt_new,distance=..3] tt_timer *= #tt_scale nuke.settings

tag @e[tag=tt_new,distance=..3] remove tt_new

playsound minecraft:block.wooden_button.click_on block @a[distance=..16] ~0.5 ~0.5 ~0.5 1 1
kill @s
