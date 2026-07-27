# СМЫВ ВОДОЙ: заряд выпадает ПРЕДМЕТОМ ТОГО ЖЕ УРОВНЯ.
# Контекст: as <block_display tt_display>, at @s.
execute if score @s tt_hours matches 1 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:1},"minecraft:custom_name":{text:"Таймер-ТНТ (1 час)",color:"gold",bold:true,italic:false}}}}
execute if score @s tt_hours matches 2 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:2},"minecraft:custom_name":{text:"Таймер-ТНТ (2 часа)",color:"gold",bold:true,italic:false}}}}
execute if score @s tt_hours matches 3 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:3},"minecraft:custom_name":{text:"Таймер-ТНТ (3 часа)",color:"gold",bold:true,italic:false}}}}
execute if score @s tt_hours matches 4 run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_data":{timer_tnt:4},"minecraft:custom_name":{text:"Таймер-ТНТ (4 часа)",color:"gold",bold:true,italic:false}}}}

playsound minecraft:block.fire.extinguish block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~0.5 ~1 ~0.5 0.3 0.3 0.3 15 0.02

kill @e[type=minecraft:text_display,tag=tt_text,distance=..3]
kill @e[type=minecraft:marker,tag=tt_marker,distance=..3]
kill @e[type=minecraft:interaction,tag=tt_hitbox,distance=..3]
kill @s
