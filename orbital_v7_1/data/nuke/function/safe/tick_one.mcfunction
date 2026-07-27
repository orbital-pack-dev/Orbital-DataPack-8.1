# Context: Safe marker at its chest.
execute unless block ~ ~ ~ minecraft:chest run return run function nuke:safe/drop
function nuke:safe/break_neighbors

# Near players: hide only the runtime guard so the chest UI is clickable.
execute if entity @a[distance=..6] run kill @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3]

# No nearby player: seal and recreate the interaction guard.
execute unless entity @a[distance=..6] run function nuke:safe/seal
execute unless entity @a[distance=..6] run function nuke:safe/ensure_interaction
