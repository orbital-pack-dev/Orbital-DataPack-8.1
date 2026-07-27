# Контекст: as <minecraft:wind_charge с тегом light_tnt>, at @s.
# ЗДЕСЬ НЕТ НИ ОДНОГО обращения к игроку: всё от координат снаряда.
tag @s add lt_processed

# Дисплей рождается РОВНО в точке снаряда (снаряд уже вылетел из руки).
summon minecraft:block_display ~ ~ ~ {Tags:["lt_display","lt_new"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.25f,-0.25f,-0.25f],scale:[0.5f,0.5f,0.5f]}}
scoreboard players set @e[type=minecraft:block_display,tag=lt_new,distance=..2] orb_ticks 0
tag @e[type=minecraft:block_display,tag=lt_new,distance=..2] remove lt_new

playsound minecraft:entity.tnt.primed master @a[distance=..16] ~ ~ ~ 1 1.4
particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 3 0.01
