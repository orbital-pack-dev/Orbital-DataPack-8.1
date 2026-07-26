# ARCHI-SHIELD MAIN LOGIC (Minecraft 1.21.11)
# Runs as the player every tick while holding Archi-Shield in mainhand or offhand.

# 1) Targeted protection on block/hit:
execute if score @s damage_taken matches 1.. run function nuke:archi_shield/hit_defense
execute if score @s damage_blocked_by_shield matches 1.. run function nuke:archi_shield/hit_defense
execute if predicate nuke:is_sneaking at @s run function nuke:archi_shield/sneak_active


# Visual Overhaul: Archi-Shield rotating energy aura
particle nautilus ~ ~1 ~ 0.6 0.5 0.6 0.02 2
particle enchant ~ ~1 ~ 0.5 0.5 0.5 0.05 2
