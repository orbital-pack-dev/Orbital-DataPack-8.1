# Инициализация Лёгкого ТНТ. Контекст: as <wind_charge>, at @s.
tag @s add lt_processed

summon minecraft:block_display ~ ~ ~ {Tags:["lt_display","lt_new"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.25f,-0.25f,-0.25f],scale:[0.5f,0.5f,0.5f]}}

# Запоминаем владельца, чтобы урон от взрыва засчитался игроку.
execute as @p[distance=..8] run function nuke:util/assign_pid
execute if entity @p[distance=..8] run scoreboard players operation @e[type=minecraft:block_display,tag=lt_new,distance=..2,limit=1] nuke.pid = @p[distance=..8] nuke.pid

ride @e[type=minecraft:block_display,tag=lt_new,distance=..2,limit=1] mount @s
tag @e[type=minecraft:block_display,tag=lt_new,distance=..2,limit=1] remove lt_new
playsound minecraft:entity.tnt.primed neutral @a[distance=..16] ~ ~ ~ 0.6 1.6
