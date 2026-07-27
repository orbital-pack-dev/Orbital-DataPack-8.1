# Надеваем ОДИН заряд. Контекст: as <Гаст>, at @s.
scoreboard players add @s ghast_tnt 1
execute if score @s ghast_tnt matches 15.. run scoreboard players set @s ghast_tnt 14

# Съедаем ровно один предмет из ближайшего стека.
execute as @e[type=minecraft:item,distance=..6,nbt={Item:{id:"minecraft:tnt"}},limit=1,sort=nearest] run function nuke:happy_ghast/eat_one

# Визуал заряда на модельке.
summon minecraft:block_display ~ ~1 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.6f,0.6f,0.6f]}}

playsound minecraft:entity.tnt.primed master @a[distance=..24] ~ ~ ~ 1 1.2
particle minecraft:smoke ~ ~1 ~ 0.5 0.5 0.5 8 0.02
title @a[distance=..12] actionbar ["",{"text":"Гаст принял ТНТ: ","color":"gold"},{"score":{"name":"@s","objective":"ghast_tnt"},"color":"red","bold":true},{"text":" / 14","color":"gold"}]
