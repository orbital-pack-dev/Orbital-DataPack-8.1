# Выполняется as игрок с надетым жилетом, at @s
execute unless score @s bv_active matches 1 run return run function nuke:blast_vest/init

# Отсчёт уменьшается РОВНО ОДИН раз за тик и только здесь.
scoreboard players remove @s bv_timer 1

function nuke:blast_vest/display

# Досрочный подрыв на шифте
execute if predicate nuke:is_sneaking run return run function nuke:blast_vest/detonate

execute if score @s bv_timer matches ..0 run function nuke:blast_vest/detonate
