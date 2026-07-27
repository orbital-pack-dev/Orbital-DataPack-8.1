# Взвод Подрывного Жилета. Контекст: as <игрок в жилете>, at @s.
scoreboard players set @s bv_active 1

# Длительность из настроек (по умолчанию 640 тиков = 32 сек).
scoreboard players set @s bv_timer 640
execute if score nuke.cfg.bv_time nuke.settings matches 1.. run scoreboard players operation @s bv_timer = nuke.cfg.bv_time nuke.settings

tag @s add bv_owner
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
tellraw @s ["",{"text":"[ЖИЛЕТ] ","color":"red","bold":true},{"text":"Таймер активирован. Снять жилет невозможно. Шифт — подрыв сразу.","color":"gold"}]
