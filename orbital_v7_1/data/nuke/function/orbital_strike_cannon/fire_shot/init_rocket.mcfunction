# ORBITAL MORTAR - INIT ROCKET
tag @s add orb_processed
scoreboard players set @s orb_ticks 0

# Prevent vanilla from exploding the rocket early — override LifeTime
data merge entity @s {LifeTime:1200,Life:0,ShotAtAngle:1b}

# Tag the nearest player as owner
execute as @p[distance=..10,sort=nearest,limit=1] run tag @s add orb_owner

# Check cooldown
execute if score personal_cd nuke.settings matches 1.. as @p[tag=orb_owner,scores={mortar_delay=1..}] run title @s actionbar {"text":"MORTAR: перезарядка","color":"gold"}
execute if score personal_cd nuke.settings matches 1.. if entity @p[tag=orb_owner,scores={mortar_delay=1..}] run kill @s
execute if score personal_cd nuke.settings matches 1.. unless entity @s run return 0

# Check XP requirement and spend XP
execute as @p[tag=orb_owner] run scoreboard players operation @s nuke.xp_cost = nuke.cfg.xp_mortar nuke.settings
execute as @p[tag=orb_owner] run function nuke:check_xp
execute if entity @p[tag=orb_owner,scores={nuke.action_ok=0}] run kill @s
execute unless entity @s run return 0

# Apply cooldown
execute if score personal_cd nuke.settings matches 1.. run scoreboard players operation @p[tag=orb_owner] mortar_delay = nuke.cfg.mortar_cd nuke.settings
