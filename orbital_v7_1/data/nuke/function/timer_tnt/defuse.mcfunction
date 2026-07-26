# Смывание водой / аварийный съём. Контекст: as <block_display>, at @s.
# Заряд ОБЯЗАН выпасть именно тем уровнем, который был взведён.
execute if block ~ ~ ~ minecraft:barrier run setblock ~ ~ ~ minecraft:air replace
playsound minecraft:block.fire.extinguish block @a[distance=..16] ~0.5 ~0.5 ~0.5 1 1
particle minecraft:cloud ~0.5 ~0.8 ~0.5 0.2 0.2 0.2 12 0.02

execute if score @s tt_hours matches 1 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:1},"minecraft:custom_name":{"text":"Таймер-ТНТ (1 ч.)","color":"red","bold":true,"italic":false},"minecraft:lore":[{"text":"Положите на твёрдую опору, чтобы взвести","color":"gray","italic":false}]}}}
execute if score @s tt_hours matches 2 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:2},"minecraft:custom_name":{"text":"Таймер-ТНТ (2 ч.)","color":"red","bold":true,"italic":false},"minecraft:lore":[{"text":"Положите на твёрдую опору, чтобы взвести","color":"gray","italic":false}]}}}
execute if score @s tt_hours matches 3 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:3},"minecraft:custom_name":{"text":"Таймер-ТНТ (3 ч.)","color":"red","bold":true,"italic":false},"minecraft:lore":[{"text":"Положите на твёрдую опору, чтобы взвести","color":"gray","italic":false}]}}}
execute if score @s tt_hours matches 4 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Tags:["tt_init"],Item:{id:"minecraft:tnt_minecart",count:1,components:{"minecraft:custom_data":{timer_tnt:4},"minecraft:custom_name":{"text":"Таймер-ТНТ (4 ч.)","color":"red","bold":true,"italic":false},"minecraft:lore":[{"text":"Положите на твёрдую опору, чтобы взвести","color":"gray","italic":false}]}}}

kill @e[type=minecraft:text_display,tag=tt_text,distance=..3]
kill @s
