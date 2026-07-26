# Закрепление ТНТ на Гасте. Контекст: as гаст, at гаст. Игрок = @a[tag=gt_user].
execute if score @s ghast_tnt matches 14.. run tellraw @a[tag=gt_user,limit=1] [{"text":"[!] ","color":"yellow"},{"text":"На этом Гасте уже максимум ТНТ (14/14)!","color":"red"}]
execute if score @s ghast_tnt matches 14.. run return fail

clear @a[tag=gt_user,limit=1] minecraft:tnt 1
scoreboard players add @s ghast_tnt 1

# Запоминаем владельца заряда для зачёта убийств.
execute as @a[tag=gt_user,limit=1] run function nuke:util/assign_pid
scoreboard players operation @s nuke.pid = @a[tag=gt_user,limit=1] nuke.pid

playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 2 1.2
particle minecraft:smoke ~ ~2 ~ 0.5 0.5 0.5 0.05 15
summon minecraft:block_display ~ ~1.5 ~ {Tags:["ghast_tnt_display"],teleport_duration:2,block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.4f,-0.4f,-0.4f],scale:[0.8f,0.8f,0.8f]}}

tellraw @a[tag=gt_user,limit=1] [{"text":"[КАМИКАДЗЕ] ","color":"red","bold":true},{"text":"Заряд ТНТ закреплён на Гасте! Всего: ","color":"yellow","bold":false},{"score":{"name":"@s","objective":"ghast_tnt"},"color":"red","bold":true},{"text":"/14","color":"gray","bold":false}]
