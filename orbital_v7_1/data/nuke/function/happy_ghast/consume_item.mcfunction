# Съедание брошенного предмета ТНТ Гастом
# @s = Предмет ТНТ, контекст - позиция Гаста (execute as ghast at ghast as item)
scoreboard players add @n[type=#nuke:ghast_types,distance=..20] ghast_tnt 1
execute at @n[type=#nuke:ghast_types,distance=..20] run playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 2 1.2
execute at @n[type=#nuke:ghast_types,distance=..20] run particle smoke ~ ~2 ~ 0.5 0.5 0.5 0.05 15
execute at @n[type=#nuke:ghast_types,distance=..20] run summon block_display ~ ~1.5 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.4f,-0.4f,-0.4f],scale:[0.8f,0.8f,0.8f]}}
execute at @n[type=#nuke:ghast_types,distance=..20] run tellraw @p ["",{"text":"[💣 КАМИКАДЗЕ] ","color":"red","bold":true},{"text":"Заряд ТНТ закреплён на Гасте!","color":"yellow"}]

kill @s
