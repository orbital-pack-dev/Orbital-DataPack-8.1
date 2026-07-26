scoreboard players set nuke.bd_count nuke.temp 0
execute as @e[type=block_display,tag=withershot] run scoreboard players add nuke.bd_count nuke.temp 1
execute if score nuke.bd_count nuke.temp matches 1.. run return 0

summon block_display ~ ~ ~ {Tags:["withershot"]}
summon area_effect_cloud ~ ~ ~ {Tags:["withershot_owner"],Radius:0f,Duration:1000}
data modify entity @e[type=area_effect_cloud,tag=withershot_owner,distance=..1,limit=1,sort=nearest] Owner set from entity @s UUID

particle minecraft:large_smoke ~ ~2 ~ 1.2 1.2 1.2 0.02 80 force
playsound minecraft:entity.wither.spawn master @a[distance=..80] ~ ~ ~ 1 1.25
