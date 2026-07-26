# Прикрепление ТНТ к Гасту/Счастливой Гасту
execute if score @s ghast_tnt matches 14.. run tellraw @p ["",{"text":"[⚠️] ","color":"yellow"},{"text":"На этом Гасте уже закреплено максимум ТНТ (14/14)!","color":"red"}]
execute if score @s ghast_tnt matches 14.. run return 0

clear @p tnt 1
scoreboard players add @s ghast_tnt 1

playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 2 1.2
particle smoke ~ ~2 ~ 0.5 0.5 0.5 0.05 15
summon block_display ~ ~1.5 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.4f,-0.4f,-0.4f],scale:[0.8f,0.8f,0.8f]}}

tellraw @p ["",{"text":"[💣 КАМИКАДЗЕ] ","color":"red","bold":true},{"text":"Заряд ТНТ закреплён на Гасте! Всего: ","color":"yellow"},{"score":{"name":"@s","objective":"ghast_tnt"},"color":"red","bold":true},{"text":"/14","color":"gray"}]
