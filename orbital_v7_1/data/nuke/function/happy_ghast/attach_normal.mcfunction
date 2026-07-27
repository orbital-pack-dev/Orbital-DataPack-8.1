# Consume one TNT and attach one indexed display to the nearest Ghast.
scoreboard players add @e[type=minecraft:ghast,distance=..6,scores={ghast_tnt=..13},limit=1,sort=nearest] ghast_tnt 1
execute as @e[type=minecraft:ghast,distance=..6,limit=1,sort=nearest] at @s run function nuke:happy_ghast/spawn_display
execute store result score @e[type=minecraft:ghast,distance=..6,limit=1,sort=nearest] orb_ticks run data get entity @e[type=minecraft:ghast,distance=..6,limit=1,sort=nearest] Health 100
playsound minecraft:entity.tnt.primed master @a[distance=..24] ~ ~ ~ 1 1.2
execute store result score #ghast_stack nuke.settings run data get entity @s Item.count
execute if score #ghast_stack nuke.settings matches 2.. run function nuke:happy_ghast/shrink_stack
execute if score #ghast_stack nuke.settings matches 1 run kill @s
