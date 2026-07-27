# Обновление времени. Контекст: as <block_display tt_display>, at @s.
scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings

# 1) Гарантированный канал: actionbar рядом стоящим игрокам (скор-компонент).
title @a[distance=..10] actionbar ["",{"text":"ТАЙМЕР-ТНТ: ","color":"red","bold":true},{"score":{"name":"@s","objective":"tt_seconds"},"color":"yellow","bold":true},{"text":" сек","color":"red","bold":true}]

# 2) Имя над зарядом через CustomName хитбокса.
execute store result storage nuke:tt sec int 1 run scoreboard players get @s tt_seconds
function nuke:timer_tnt/set_text with storage nuke:tt
