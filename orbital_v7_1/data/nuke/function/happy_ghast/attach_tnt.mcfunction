# Контекст: as <happy_ghast>, at @s.
execute if score @s ghast_tnt matches 4.. run return 0

clear @a[tag=gt_user,limit=1] minecraft:tnt 1
scoreboard players add @s ghast_tnt 1

# Запоминаем владельца прицепа для правильного зачёта убийств.
execute as @a[tag=gt_user,limit=1] run function nuke:util/assign_pid
execute if entity @a[tag=gt_user,limit=1] run scoreboard players operation @s nuke.pid = @a[tag=gt_user,limit=1] nuke.pid

summon minecraft:block_display ~ ~2.4 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.35f,0.0f,-0.35f],scale:[0.7f,0.7f,0.7f]}}

playsound minecraft:entity.tnt.primed neutral @a[distance=..24] ~ ~ ~ 1 1
tellraw @a[tag=gt_user,limit=1] [{"text":"[ГАСТ] ","color":"aqua","bold":true},{"text":"ТНТ прицеплён. Шифт + ПКМ — подрыв.","color":"gray","bold":false}]
