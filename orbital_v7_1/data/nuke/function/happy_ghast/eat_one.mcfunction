# Context: one TNT item near an eligible Ghast.
execute if entity @e[type=minecraft:happy_ghast,distance=..6,scores={ghast_tnt=..13},limit=1,sort=nearest] run function nuke:happy_ghast/attach_happy
execute unless entity @e[type=minecraft:happy_ghast,distance=..6,scores={ghast_tnt=..13},limit=1] if entity @e[type=minecraft:ghast,distance=..6,scores={ghast_tnt=..13},limit=1,sort=nearest] run function nuke:happy_ghast/attach_normal
