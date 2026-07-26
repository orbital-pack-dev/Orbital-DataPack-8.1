# Инициализация брошенного Лёгкого ТНТ. @s = wind_charge.
tag @s add lt_processed
scoreboard players set #lt_pid nuke.settings 0
execute as @p[distance=..8] run function nuke:util/assign_pid
execute if entity @p[distance=..8] run scoreboard players operation #lt_pid nuke.settings = @p[distance=..8] nuke.pid
summon minecraft:block_display ~ ~ ~ {Tags:["lt_display","lt_new"],teleport_duration:0,block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.3f,-0.3f,-0.3f],scale:[0.6f,0.6f,0.6f]}}
scoreboard players operation @e[type=block_display,tag=lt_new,limit=1,distance=..2] nuke.pid = #lt_pid nuke.settings
tag @e[type=block_display,tag=lt_new,distance=..2] remove lt_new
