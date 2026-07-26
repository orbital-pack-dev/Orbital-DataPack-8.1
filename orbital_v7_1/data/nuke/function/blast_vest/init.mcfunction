# Выполняется as игрок, at @s — момент надевания жилета
scoreboard players set @s bv_active 1
function nuke:util/assign_pid
tag @s add bv_owner

# Время отсчёта из настроек (дефолт 640 тиков = 32 сек)
scoreboard players set @s bv_timer 640
execute if score bv_time nuke.settings matches 1.. run scoreboard players operation @s bv_timer = bv_time nuke.settings
execute if score nuke.cfg.bv_time nuke.settings matches 1.. run scoreboard players operation @s bv_timer = nuke.cfg.bv_time nuke.settings

title @s title {"text":"ЖИЛЕТ АКТИВИРОВАН","color":"red","bold":true}
title @s subtitle {"text":"Снять невозможно. Шифт — подрыв сразу","color":"gray"}
playsound minecraft:block.note_block.pling player @a[distance=..24] ~ ~ ~ 1 0.6
playsound minecraft:entity.tnt.primed player @a[distance=..24] ~ ~ ~ 1 1
