# Выполняется as предмет-ТНТ, at @s
scoreboard players add @e[type=minecraft:happy_ghast,distance=..6,limit=1,sort=nearest] ghast_tnt 1
execute unless entity @e[type=minecraft:happy_ghast,distance=..6] run scoreboard players add @e[type=minecraft:ghast,distance=..6,limit=1,sort=nearest] ghast_tnt 1

summon minecraft:block_display ~ ~2 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.35f,-0.35f,-0.35f],scale:[0.7f,0.7f,0.7f]}}

playsound minecraft:entity.tnt.primed neutral @a[distance=..32] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~1 ~ 0.3 0.3 0.3 10 0.02
kill @s
