execute if score @s archi_delay matches 1.. run return 0
scoreboard players set @s archi_delay 100
execute if score nuke.cfg.archi_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = nuke.cfg.archi_cd nuke.settings

tag @s add archi_user
function nuke:archi_shield/knockback_and_thorns
tag @s remove archi_user

effect give @s minecraft:resistance 3 2 true
effect give @s minecraft:absorption 8 1 true
particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
particle minecraft:end_rod ~ ~1 ~ 1 1 1 0.05 30 force
playsound minecraft:item.shield.block master @a[distance=..16] ~ ~ ~ 1 0.7
title @s actionbar {"text":"АРХИ-ЩИТ: защита сработала","color":"aqua","bold":true}
execute if items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] run item modify entity @s weapon.mainhand nuke:damage_shield
execute unless items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] run item modify entity @s weapon.offhand nuke:damage_shield
