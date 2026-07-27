# Обезвреживание (вода или снятие блока). Дроп ТОГО ЖЕ уровня.
# Контекст: as <marker tt_marker>, at @s.
setblock ~ ~ ~ air replace
execute if score @s tt_hours matches 1 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:1},"minecraft:item_name":'{"text":"Таймер-ТНТ (1 час)","color":"gold","italic":false}'}}}
execute if score @s tt_hours matches 2 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:2},"minecraft:item_name":'{"text":"Таймер-ТНТ (2 часа)","color":"gold","italic":false}'}}}
execute if score @s tt_hours matches 3 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:3},"minecraft:item_name":'{"text":"Таймер-ТНТ (3 часа)","color":"gold","italic":false}'}}}
execute if score @s tt_hours matches 4 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:4},"minecraft:item_name":'{"text":"Таймер-ТНТ (4 часа)","color":"gold","italic":false}'}}}
playsound minecraft:block.fire.extinguish block @a[distance=..16] ~ ~ ~ 1 1
kill @e[type=minecraft:text_display,tag=tt_text,distance=..3]
kill @s
