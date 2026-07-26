# Старый код пытался вывести время через {"score":{"name":"@e[...]"}} в NBT text_display.
# Селектор в score.name там не резолвится, поэтому таймер вообще не отображался.
# Теперь значение подставляется макросом.
execute store result storage nuke:tt sec int 1 run scoreboard players get @s tt_seconds
function nuke:timer_tnt/set_text with storage nuke:tt
