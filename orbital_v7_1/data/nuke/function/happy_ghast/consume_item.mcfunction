# Гаст "съедает" брошенный ТНТ. Контекст: as гаст, at гаст.
# Раньше функция выполнялась как предмет и дублировала всю логику крепления
# через @n[...distance=..20], что цепляло чужих гастов.
execute as @e[type=item,distance=..3] if data entity @s Item{id:"minecraft:tnt"} run tag @s add gt_eat
execute unless entity @e[type=item,tag=gt_eat,distance=..3] run return fail
kill @e[type=item,tag=gt_eat,distance=..3]

execute if score @s ghast_tnt matches 14.. run return fail
scoreboard players add @s ghast_tnt 1
execute unless score @s nuke.pid matches 1.. as @p[distance=..24] run function nuke:util/assign_pid
execute unless score @s nuke.pid matches 1.. if entity @p[distance=..24] run scoreboard players operation @s nuke.pid = @p[distance=..24] nuke.pid

playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 2 1.2
particle minecraft:smoke ~ ~2 ~ 0.5 0.5 0.5 0.05 15
summon minecraft:block_display ~ ~1.5 ~ {Tags:["ghast_tnt_display"],teleport_duration:2,block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.4f,-0.4f,-0.4f],scale:[0.8f,0.8f,0.8f]}}
