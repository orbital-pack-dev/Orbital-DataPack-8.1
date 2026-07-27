# Ensure fresh Ghasts have a score so scores={ghast_tnt=..13} can match them.
scoreboard players add @e[type=minecraft:happy_ghast] ghast_tnt 0
scoreboard players add @e[type=minecraft:ghast] ghast_tnt 0

execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:tnt"}}] at @s if entity @e[type=minecraft:happy_ghast,distance=..6,scores={ghast_tnt=..13},limit=1] run function nuke:happy_ghast/eat_one
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:tnt"}}] at @s unless entity @e[type=minecraft:happy_ghast,distance=..6,scores={ghast_tnt=..13},limit=1] if entity @e[type=minecraft:ghast,distance=..6,scores={ghast_tnt=..13},limit=1] run function nuke:happy_ghast/eat_one

execute as @e[type=minecraft:happy_ghast,scores={ghast_tnt=1..14}] at @s run function nuke:happy_ghast/tick_one
execute as @e[type=minecraft:ghast,scores={ghast_tnt=1..14}] at @s run function nuke:happy_ghast/tick_one
