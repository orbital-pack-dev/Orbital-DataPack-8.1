# Подрывной Жилет, основной тик. Контекст: as игрок, at игрок.
execute unless score @s bv_active matches 1 run function nuke:blast_vest/init
scoreboard players remove @s[scores={bv_timer=1..}] bv_timer 1
execute if score @s bv_timer matches 1.. run function nuke:blast_vest/display
execute if score @s bv_timer matches ..0 if score @s bv_active matches 1 run function nuke:blast_vest/detonate
