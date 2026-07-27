# Контекст: as <wind_charge с тегом light_tnt>, at @s.
tag @s add lt_processed
summon minecraft:block_display ~ ~ ~ {Tags:["lt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.25f,-0.25f,-0.25f],scale:[0.5f,0.5f,0.5f]}}
playsound minecraft:entity.tnt.primed master @a[distance=..16] ~ ~ ~ 1 1.4
