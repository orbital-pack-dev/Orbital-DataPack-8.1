# Аудит-3: визуал БОЛЬШЕ НЕ садится верхом на wind_charge (именно посадка
# замораживала его в воздухе и отрезала детонацию). Теперь дисплей —
# самостоятельная сущность, которая каждый тик летит за зарядом и крутится.
tag @s add lt_processed

execute as @p[distance=..10] run function nuke:util/assign_pid

summon minecraft:block_display ~ ~ ~ {Tags:["lt_display","lt_new"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.3f,-0.3f,-0.3f],scale:[0.6f,0.6f,0.6f]}}

scoreboard players set @e[type=minecraft:block_display,tag=lt_new,distance=..3] orb_ticks 0
execute if entity @p[distance=..10] run scoreboard players operation @e[type=minecraft:block_display,tag=lt_new,distance=..3] nuke.pid = @p[distance=..10] nuke.pid
tag @e[type=minecraft:block_display,tag=lt_new,distance=..3] remove lt_new

playsound minecraft:entity.tnt.primed block @a[distance=..24] ~ ~ ~ 1 1.4
