# Контекст: as <item с ТНТ>, at @s.
scoreboard players add @e[type=minecraft:happy_ghast,distance=..4,limit=1,sort=nearest] ghast_tnt 1
summon minecraft:block_display ~ ~1 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.35f,0.0f,-0.35f],scale:[0.7f,0.7f,0.7f]}}
playsound minecraft:entity.generic.eat neutral @a[distance=..16] ~ ~ ~ 1 0.8
kill @s
