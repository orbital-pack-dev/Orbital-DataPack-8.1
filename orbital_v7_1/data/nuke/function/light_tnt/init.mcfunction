# Контекст: as <wind_charge с тегом light_tnt>, at @s.
# Максимально простой спавн: минимум NBT, никаких скоров/макросов на этом этапе.
tag @s add lt_processed

summon minecraft:block_display ~ ~ ~ {Tags:["lt_display","lt_new"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.25f,-0.25f,-0.25f],scale:[0.5f,0.5f,0.5f]}}
scoreboard players set @e[type=minecraft:block_display,tag=lt_new,distance=..3] orb_ticks 0
tag @e[type=minecraft:block_display,tag=lt_new,distance=..3] remove lt_new

playsound minecraft:entity.tnt.primed master @a[distance=..16] ~ ~ ~ 1 1.4
particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 3 0.01
