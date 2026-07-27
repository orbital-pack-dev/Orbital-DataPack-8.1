# Context: the tagged wind charge itself.
tag @s add lt_processed
summon minecraft:block_display ~ ~ ~ {Tags:["lt_display"],block_state:{Name:"minecraft:tnt"},teleport_duration:0,transformation:{translation:[-0.25f,-0.25f,-0.25f],scale:[0.5f,0.5f,0.5f]}}
playsound minecraft:entity.tnt.primed master @a[distance=..16] ~ ~ ~ 1 1.4
