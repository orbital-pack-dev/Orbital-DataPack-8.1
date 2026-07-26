# Защита от дублирования: максимум 3 одновременных stabshot
scoreboard players set nuke.bd_count nuke.temp 0
execute as @e[type=block_display,tag=stabshot] run scoreboard players add nuke.bd_count nuke.temp 1
execute if score nuke.bd_count nuke.temp matches 3.. run return 0

summon block_display ~ ~ ~ {Tags:["stabshot"]}
summon area_effect_cloud ~ ~ ~ {Tags:["stabshot_owner"],Radius:0f,Duration:1000}
data modify entity @e[type=area_effect_cloud,tag=stabshot_owner,distance=..1,limit=1,sort=nearest] Owner set from entity @s UUID
