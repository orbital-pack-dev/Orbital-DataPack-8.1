# Defuse once; dropped item is pre-tagged so it cannot immediately re-arm.
execute if score @s tt_hours matches 1 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:1},"minecraft:item_name":{text:"Таймер-ТНТ (1 ч.)",color:"red",italic:false}}}}
execute if score @s tt_hours matches 2 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:2},"minecraft:item_name":{text:"Таймер-ТНТ (2 ч.)",color:"red",italic:false}}}}
execute if score @s tt_hours matches 3 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:3},"minecraft:item_name":{text:"Таймер-ТНТ (3 ч.)",color:"red",italic:false}}}}
execute if score @s tt_hours matches 4 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:4},"minecraft:item_name":{text:"Таймер-ТНТ (4 ч.)",color:"red",italic:false}}}}
playsound minecraft:block.fire.extinguish block @a[distance=..16] ~ ~ ~ 1 1
function nuke:timer_tnt/cleanup
