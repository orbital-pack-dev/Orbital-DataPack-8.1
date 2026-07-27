# Context: TNT item; mount one display on the nearest eligible Happy Ghast.
scoreboard players add @e[type=minecraft:happy_ghast,distance=..6,scores={ghast_tnt=..13},limit=1,sort=nearest] ghast_tnt 1
execute at @e[type=minecraft:happy_ghast,distance=..6,limit=1,sort=nearest] run summon minecraft:block_display ~ ~-0.6 ~ {Tags:["ghast_tnt_display","ghast_tnt_new"],block_state:{Name:"minecraft:tnt"},transformation:{translation:[-0.3f,-0.3f,-0.3f],scale:[0.6f,0.6f,0.6f]}}
ride @e[type=minecraft:block_display,tag=ghast_tnt_new,distance=..8,limit=1,sort=nearest] mount @e[type=minecraft:happy_ghast,distance=..6,limit=1,sort=nearest]
tag @e[type=minecraft:block_display,tag=ghast_tnt_new,distance=..8,limit=1,sort=nearest] remove ghast_tnt_new
playsound minecraft:entity.tnt.primed master @a[distance=..24] ~ ~ ~ 1 1.2
kill @s
