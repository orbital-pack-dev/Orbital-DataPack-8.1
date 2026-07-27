# ОБЕЗВРЕЖИВАНИЕ. Контекст: as <marker tt_marker>, at @s.
# Дроп сразу помечен tt_init: упавший предмет НЕ взведётся повторно
# и НЕ создаст петлю взвод-обезвреживание. Поднял и положил — работает снова.
execute if score @s tt_hours matches 1 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:1},"minecraft:item_name":'{"text":"Таймер-ТНТ (1 час)","color":"gold","italic":false}'}}}
execute if score @s tt_hours matches 2 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:2},"minecraft:item_name":'{"text":"Таймер-ТНТ (2 часа)","color":"gold","italic":false}'}}}
execute if score @s tt_hours matches 3 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:3},"minecraft:item_name":'{"text":"Таймер-ТНТ (3 часа)","color":"gold","italic":false}'}}}
execute if score @s tt_hours matches 4 run summon minecraft:item ~ ~ ~ {Tags:["tt_init"],Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:4},"minecraft:item_name":'{"text":"Таймер-ТНТ (4 часа)","color":"gold","italic":false}'}}}
playsound minecraft:block.fire.extinguish block @a[distance=..16] ~ ~ ~ 1 1
kill @e[type=minecraft:block_display,tag=tt_display,distance=..2]
kill @e[type=minecraft:text_display,tag=tt_text,distance=..2]
kill @s
