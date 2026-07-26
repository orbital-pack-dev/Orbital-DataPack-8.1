# activate_shots/stab — колонна ТНТ разбита на 15 тиков
scoreboard players add @s stabshot_timer 1

# Blast (урон по игрокам) — один раз на тике 20
execute if score @s stabshot_timer matches 20 at @s run function nuke:orbital_strike_cannon/stabshot_px/blast_stab_core

# Части колонны: по одной части в тик (тики 20–34)
execute if score @s stabshot_timer matches 20 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p0
execute if score @s stabshot_timer matches 21 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p1
execute if score @s stabshot_timer matches 22 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p2
execute if score @s stabshot_timer matches 23 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p3
execute if score @s stabshot_timer matches 24 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p4
execute if score @s stabshot_timer matches 25 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p5
execute if score @s stabshot_timer matches 26 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p6
execute if score @s stabshot_timer matches 27 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p7
execute if score @s stabshot_timer matches 28 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p8
execute if score @s stabshot_timer matches 29 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p9
execute if score @s stabshot_timer matches 30 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p10
execute if score @s stabshot_timer matches 31 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p11
execute if score @s stabshot_timer matches 32 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p12
execute if score @s stabshot_timer matches 33 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p13
execute if score @s stabshot_timer matches 34 at @s run function nuke:orbital_strike_cannon/stabshot_px/stabshot_p14

execute if score @s stabshot_timer matches 35.. at @s run kill @e[type=area_effect_cloud,tag=stabshot_owner,distance=..1]
execute if score @s stabshot_timer matches 35.. run kill @s

# Visual Overhaul: Stab-Shot electric trail & sparks
particle electric_spark ~ ~ ~ 0.3 0.3 0.3 0.08 4
particle end_rod ~ ~ ~ 0.2 0.2 0.2 0.03 2
