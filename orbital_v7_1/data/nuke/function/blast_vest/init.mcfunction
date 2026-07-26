# Инициализация Подрывного Жилета при надевании
scoreboard players set @s bv_active 1
scoreboard players operation @s bv_timer = nuke.cfg.bv_time nuke.settings
execute if score @s bv_timer matches ..0 run scoreboard players set @s bv_timer 640
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
tellraw @s ["",{"text":"[⚠️ БОМБА] ","color":"red","bold":true},{"text":"Подрывной Жилет активирован! Обратный отсчёт пошёл!","color":"yellow"}]
