# ORBITAL MORTAR - HORIZONTAL RING STEP (RECURSIVE)
execute at @s run summon firework_rocket ^ ^ ^1.5 {LifeTime:35,Tags:["orb_new_horiz","orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16755200,65280],has_trail:1b,has_twinkle:1b}]}}}}
execute at @s positioned 0.0 0.0 0.0 rotated as @s run summon marker ^ ^ ^0.5 {Tags:["orb_vector"]}
data modify entity @e[type=firework_rocket,tag=orb_new_horiz,limit=1,sort=nearest] Motion set from entity @e[type=marker,tag=orb_vector,limit=1] Pos
kill @e[type=marker,tag=orb_vector]
scoreboard players set @e[type=firework_rocket,tag=orb_new_horiz] orb_lifetime 0
tag @e[type=firework_rocket,tag=orb_new_horiz] remove orb_new_horiz
tp @s ~ ~ ~ ~22.5 ~
scoreboard players remove @s orb_ticks 1
execute if score @s orb_ticks matches 1.. at @s run function nuke:orbital_strike_cannon/fire_shot/spawn_horizontal_step
