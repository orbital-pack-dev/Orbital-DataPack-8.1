# ORBITAL MORTAR - MAIN ROCKET BRAIN
scoreboard players add @s orb_ticks 1

# Keep rocket alive while flying — reset Life counter every tick
data modify entity @s Life set value 0

# HOMING — smooth turning curve towards nearest valid target
execute at @s rotated as @s run summon marker ~ ~ ~ {Tags:["orb_tracker"]}
execute as @e[type=marker,tag=orb_tracker,limit=1] at @s run tp @s ^ ^ ^2.5
execute as @e[type=marker,tag=orb_tracker,limit=1] at @s facing entity @e[distance=0.1..150,type=#nuke:valid_targets,tag=!orb_owner,tag=!orb_link,tag=!orb_technical,tag=!orb_spinner,tag=!orb_spinner_vert,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert,tag=!orbital_main,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.4
tp @s ~ ~ ~ facing entity @e[type=marker,tag=orb_tracker,limit=1]
kill @e[type=marker,tag=orb_tracker]

# FORWARD MOVEMENT — convert facing direction to Motion vector (0.35 blocks/tick = 7 m/s)
execute at @s positioned 0.0 0.0 0.0 rotated as @s run summon marker ^ ^ ^0.35 {Tags:["orb_vector"]}
data modify entity @s Motion set from entity @e[type=marker,tag=orb_vector,limit=1] Pos
kill @e[type=marker,tag=orb_vector]

# TIMELINE PHASES
execute if score @s orb_ticks matches 40 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 80 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 120 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 160 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 180 run function nuke:orbital_strike_cannon/fire_shot/spawn_horizontal_ring
execute if score @s orb_ticks matches 220 run function nuke:orbital_strike_cannon/fire_shot/spawn_vertical_ring
execute if score @s orb_ticks matches 260.. run function nuke:orbital_strike_cannon/fire_shot/main_explosion

# DETONATION TRIGGERS (Contact with enemy or block collision after leaving crossbow)
execute if score @s orb_ticks matches 6.. if entity @e[distance=0.1..3.0,type=#nuke:valid_targets,tag=!orb_owner,tag=!orbital_child,tag=!orbital_main] run function nuke:orbital_strike_cannon/fire_shot/main_explosion
execute if score @s orb_ticks matches 6.. unless block ^ ^ ^0.6 #minecraft:air unless block ^ ^ ^0.6 #minecraft:replaceable run function nuke:orbital_strike_cannon/fire_shot/main_explosion
