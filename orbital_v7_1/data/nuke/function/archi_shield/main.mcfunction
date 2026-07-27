# Context: player holding an Archi-Shield in either hand.
execute if score @s archi_delay matches 1.. run scoreboard players remove @s archi_delay 1

# Damage statistics are reset at the end of root tick, so positive means this tick.
execute if score @s damage_taken matches 1.. run function nuke:archi_shield/hit_defense
execute unless score @s damage_taken matches 1.. if score @s damage_blocked_by_shield matches 1.. run function nuke:archi_shield/hit_defense

# Shift barrier is direct; no writable vanilla statistic is used as state.
execute if entity @s[predicate=nuke:is_sneaking] run function nuke:archi_shield/sneak_active
particle minecraft:end_rod ~ ~1 ~ 0.25 0.4 0.25 2 0.005
