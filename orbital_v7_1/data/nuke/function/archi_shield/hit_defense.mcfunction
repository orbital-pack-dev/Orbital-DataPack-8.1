# ARCHI-SHIELD HIT DEFENSE WITH COOLDOWN AND XP CHECK
# Called when player takes damage or blocks damage while holding Archi-Shield
execute if score personal_cd nuke.settings matches 1.. if score @s archi_delay matches 1.. run title @s actionbar {"text":"ARCHI-SHIELD: перезарядка","color":"gold"}
execute if score personal_cd nuke.settings matches 1.. if score @s archi_delay matches 1.. run return 0

# Check and spend XP (if configured)
scoreboard players operation @s nuke.xp_cost = nuke.cfg.xp_archi nuke.settings
scoreboard players set @s nuke.action_ok 0
function nuke:check_xp
execute if score @s nuke.action_ok matches 0 run return 0

# Apply defense buffs & smooth animated visual effects
effect give @s instant_health 1 255 true
effect give @s resistance 1 4 true
playsound minecraft:item.shield.block player @a ~ ~ ~ 1.0 1.0
particle minecraft:enchanted_hit ~ ~1 ~ 0.4 0.4 0.4 0.05 10 force
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.3 0.3 0.03 6 force

# Apply cooldown (scoreboard timer)
execute if score personal_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = nuke.cfg.archi_cd nuke.settings
