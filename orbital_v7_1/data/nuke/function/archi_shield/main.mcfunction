# Called directly only while either hand contains archi_shield:1b.
execute if score @s archi_delay matches 1.. run scoreboard players remove @s archi_delay 1
execute store result score @s nuke.temp run data get entity @s HurtTime
execute if score @s nuke.temp matches 1.. run function nuke:archi_shield/hit_defense
execute if score @s damage_taken matches 1.. run function nuke:archi_shield/hit_defense
execute if score @s damage_blocked_by_shield matches 1.. run function nuke:archi_shield/hit_defense
execute if data entity @s {Pose:"CROUCHING"} run function nuke:archi_shield/sneak_active
particle minecraft:end_rod ~ ~1 ~ 0.3 0.45 0.3 3 0.008 force
