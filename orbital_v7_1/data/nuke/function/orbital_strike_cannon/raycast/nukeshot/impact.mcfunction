# Защита от дублирования: только ОДНА активная волна NUKE за раз.
# Волна теперь живёт 548 тиков (~27 сек, гриб+кратер, 7831 ТНТ, интерливинг 3:1) —
# без этой защиты повторный выстрел до завершения волны удвоит нагрузку и обрушит сервер.
scoreboard players set nuke.bd_count nuke.temp 0
execute as @e[type=block_display,tag=nukeshot] run scoreboard players add nuke.bd_count nuke.temp 1
execute if score nuke.bd_count nuke.temp matches 1.. run return 0

summon block_display ~ ~ ~ {Tags:["nukeshot"]}
scoreboard players set @e[type=block_display,tag=nukeshot,distance=..1,limit=1,sort=nearest] nuke.power 1
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot_power:2}] run scoreboard players set @e[type=block_display,tag=nukeshot,distance=..1,limit=1,sort=nearest] nuke.power 2
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot_power:3}] run scoreboard players set @e[type=block_display,tag=nukeshot,distance=..1,limit=1,sort=nearest] nuke.power 3
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot_power:4}] run scoreboard players set @e[type=block_display,tag=nukeshot,distance=..1,limit=1,sort=nearest] nuke.power 4
summon area_effect_cloud ~ ~ ~ {Tags:["nukeshot_owner"],Radius:0f,Duration:1000}
data modify entity @e[type=area_effect_cloud,tag=nukeshot_owner,distance=..1,limit=1,sort=nearest] Owner set from entity @s UUID
