# Обезвреживание водой. @s = block_display, позиция = угол блока.
# Выпадает предмет РОВНО того уровня, который был установлен.
setblock ~ ~ ~ minecraft:air replace
playsound minecraft:block.fire.extinguish block @a ~0.5 ~0.5 ~0.5 2 1
particle minecraft:cloud ~0.5 ~0.6 ~0.5 0.3 0.3 0.3 0.03 25

execute if score @s tt_hours matches 1 run summon minecraft:item ~0.5 ~0.6 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:1},"minecraft:custom_name":{"color":"red","bold":true,"italic":false,"text":"Таймер-ТНТ (1 ч.)"}}}}
execute if score @s tt_hours matches 2 run summon minecraft:item ~0.5 ~0.6 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:2},"minecraft:custom_name":{"color":"red","bold":true,"italic":false,"text":"Таймер-ТНТ (2 ч.)"}}}}
execute if score @s tt_hours matches 3 run summon minecraft:item ~0.5 ~0.6 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:3},"minecraft:custom_name":{"color":"red","bold":true,"italic":false,"text":"Таймер-ТНТ (3 ч.)"}}}}
execute if score @s tt_hours matches 4 run summon minecraft:item ~0.5 ~0.6 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:4},"minecraft:custom_name":{"color":"red","bold":true,"italic":false,"text":"Таймер-ТНТ (4 ч.)"}}}}

kill @e[type=text_display,tag=tt_text,distance=..2,limit=1,sort=nearest]
kill @s
