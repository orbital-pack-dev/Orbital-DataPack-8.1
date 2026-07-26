# Выполняется as Гаст, at @s
clear @a[tag=gt_user,limit=1] minecraft:tnt 1
scoreboard players add @s ghast_tnt 1

execute as @a[tag=gt_user,limit=1] run function nuke:util/assign_pid
execute if entity @a[tag=gt_user,limit=1] run scoreboard players operation @s nuke.pid = @a[tag=gt_user,limit=1] nuke.pid

summon minecraft:block_display ~ ~2.5 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.35f,-0.35f,-0.35f],scale:[0.7f,0.7f,0.7f]}}

playsound minecraft:entity.tnt.primed neutral @a[distance=..32] ~ ~ ~ 1 1
tellraw @a[tag=gt_user,limit=1] [{"text":"ТНТ заминировано на Гасте. Шифт+ПКМ — подрыв.","color":"red"}]
