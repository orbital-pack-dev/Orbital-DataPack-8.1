execute unless score @s bv_active matches 1 run function nuke:blast_vest/init
scoreboard players remove @s bv_timer 1
scoreboard players operation @s nuke.temp = @s bv_timer
scoreboard players operation @s nuke.temp /= #20 nuke.settings
title @s actionbar ["",{"text":"ПОДРЫВ ЧЕРЕЗ: ","color":"red","bold":true},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow","bold":true},{"text":" сек","color":"red","bold":true}]
scoreboard players operation @s bv_mod = @s bv_timer
scoreboard players operation @s bv_mod %= #20 nuke.settings
execute if score @s bv_mod matches 0 run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1
execute if score @s bv_mod matches 0 run particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 6 0.01
execute if entity @s[predicate=nuke:is_sneaking] run return run function nuke:blast_vest/detonate
execute if score @s bv_timer matches ..0 run function nuke:blast_vest/detonate
