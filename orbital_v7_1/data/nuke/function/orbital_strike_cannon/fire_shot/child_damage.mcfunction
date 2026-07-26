# ORBITAL MORTAR - CHILD DAMAGE & ON-CONTACT DETONATION
# Check if any enemy is within 2.5 blocks; if so, instantly trigger impact detonation
execute if entity @e[distance=0.1..2.5,type=#nuke:valid_targets,tag=!orb_owner,tag=!orbital_child,tag=!orbital_main] run function nuke:orbital_strike_cannon/fire_shot/child_detonate
execute if score @s orb_lifetime matches 35.. run function nuke:orbital_strike_cannon/fire_shot/child_detonate

