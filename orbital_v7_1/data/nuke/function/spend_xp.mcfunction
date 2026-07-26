scoreboard players set @s nuke.action_ok 1
scoreboard players operation @s xp_level -= @s nuke.xp_cost
execute store result storage orbital_cannon:tmp xp int 1 run scoreboard players get @s xp_level
function nuke:spend_xp_apply with storage orbital_cannon:tmp
