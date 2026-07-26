# Прежняя версия пыталась вставить в text_display компонент
# {"score":{"name":"@e[...]","objective":"tt_seconds"}} — селектор в поле name невалиден,
# поэтому таймер не показывал время. Теперь значение прокидывается через storage.
execute store result storage nuke:tt sec int 1 run scoreboard players get @s tt_seconds
function nuke:timer_tnt/set_text with storage nuke:tt
