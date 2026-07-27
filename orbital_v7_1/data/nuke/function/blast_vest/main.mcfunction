# Контекст: as <игрок в жилете>, at @s. Самый простой таймер.
execute unless score @s bv_timer matches 1.. run scoreboard players set @s bv_timer 640
scoreboard players remove @s bv_timer 1

# Секунды для показа.
scoreboard players operation @s nuke.temp = @s bv_timer
scoreboard players operation @s nuke.temp /= #20 nuke.settings

title @s actionbar ["",{"text":"ПОДРЫВ ЧЕРЕЗ: ","color":"red","bold":true},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow","bold":true},{"text":" сек","color":"red","bold":true}]
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1
particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 3 0.01

execute if score @s bv_timer matches ..0 run function nuke:blast_vest/detonate
