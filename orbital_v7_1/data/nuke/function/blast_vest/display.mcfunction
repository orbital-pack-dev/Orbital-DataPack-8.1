# Action Bar и тикающий звук
scoreboard players operation #bv_sec nuke.settings = @s bv_timer
scoreboard players operation #bv_sec nuke.settings /= #20 nuke.settings

scoreboard players operation #bv_mod nuke.settings = @s bv_timer
scoreboard players operation #bv_mod nuke.settings %= #20 nuke.settings

execute if score #bv_mod nuke.settings matches 0 run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.0
execute if score #bv_mod nuke.settings matches 0 at @s run particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.05 10 normal

execute if score @s bv_timer matches 101.. run title @s actionbar ["",{"text":"💣 ВЗРЫВ ЧЕРЕЗ: ","color":"red","bold":true},{"score":{"name":"#bv_sec","objective":"nuke.settings"},"color":"yellow","bold":true},{"text":" сек.","color":"red"}]
execute if score @s bv_timer matches 1..100 run title @s actionbar ["",{"text":"💥 ВЗРЫВ ЧЕРЕЗ: ","color":"dark_red","bold":true},{"score":{"name":"#bv_sec","objective":"nuke.settings"},"color":"gold","bold":true},{"text":" сек.!","color":"dark_red"}]
scoreboard players remove @s bv_timer 1
