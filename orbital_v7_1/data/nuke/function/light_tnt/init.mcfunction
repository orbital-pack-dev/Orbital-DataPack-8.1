# Context is the wind_charge; summon is explicitly executed at that projectile.
tag @s add lt_spawning
scoreboard players add #pid_seq nuke.settings 1
scoreboard players operation @s nuke.pid = #pid_seq nuke.settings
execute at @e[type=minecraft:wind_charge,tag=lt_spawning,limit=1,sort=nearest] run summon minecraft:block_display ~ ~ ~ {Tags:["lt_display","lt_new"],block_state:{Name:"minecraft:tnt"},teleport_duration:0,interpolation_duration:0,transformation:{translation:[-0.25f,-0.25f,-0.25f],scale:[0.5f,0.5f,0.5f]}}
scoreboard players operation @e[type=minecraft:block_display,tag=lt_new,distance=..2,limit=1,sort=nearest] nuke.pid = @s nuke.pid
tag @e[type=minecraft:block_display,tag=lt_new,distance=..2,limit=1,sort=nearest] remove lt_new
tag @s add lt_processed
tag @s remove lt_spawning
playsound minecraft:entity.tnt.primed master @a[distance=..16] ~ ~ ~ 1 1.4
