# Контекст: as <игрок в Подрывном Жилете>, at @s.
execute unless score @s bv_active matches 1 run function nuke:blast_vest/init

# ЕДИНСТВЕННОЕ место, где уменьшается таймер.
# Раньше он уменьшался и здесь, и в display — таймер шёл вдвое быстрее.
execute if score @s bv_timer matches 1.. run scoreboard players remove @s bv_timer 1

function nuke:blast_vest/display
execute if score @s bv_timer matches ..0 run function nuke:blast_vest/detonate
