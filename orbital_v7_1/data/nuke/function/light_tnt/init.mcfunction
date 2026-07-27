# Assign one stable ID to the projectile and its display.
tag @s add lt_processed
scoreboard players add #pid_seq nuke.settings 1
scoreboard players operation @s nuke.pid = #pid_seq nuke.settings
summon minecraft:block_display ~ ~ ~ {Tags:["lt_display","lt_new"],block_state:{Name:"minecraft:tnt"},teleport_duration:0,interpolation_duration:0,transformation:{translation:[-0.25f,-0.25f,-0.25f],scale:[0.5f,0.5f,0.5f]}}
scoreboard players operation @e[type=minecraft:block_display,tag=lt_new,distance=..2,limit=1,sort=nearest] nuke.pid = @s nuke.pid
tag @e[type=minecraft:block_display,tag=lt_new,distance=..2,limit=1,sort=nearest] remove lt_new
playsound minecraft:entity.tnt.primed master @a[distance=..16] ~ ~ ~ 1 1.4
