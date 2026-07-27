# Контекст: as <предмет Динамита>, at @s.
scoreboard players add @e[type=minecraft:happy_ghast,distance=..6,limit=1,sort=nearest] ghast_tnt 1
execute unless entity @e[type=minecraft:happy_ghast,distance=..6] run scoreboard players add @e[type=minecraft:ghast,distance=..6,limit=1,sort=nearest] ghast_tnt 1

summon minecraft:block_display ~ ~1 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.6f,0.6f,0.6f]}}
playsound minecraft:entity.tnt.primed master @a[distance=..24] ~ ~ ~ 1 1.2

# Потолок 14 зарядов на Гаста.
scoreboard players set @e[type=minecraft:happy_ghast,distance=..6,scores={ghast_tnt=15..}] ghast_tnt 14
scoreboard players set @e[type=minecraft:ghast,distance=..6,scores={ghast_tnt=15..}] ghast_tnt 14

kill @s
