# Context: Safe marker at its chest.
# Missing block means break/explosion: replace vanilla chest drop with custom Safe.
execute unless block ~ ~ ~ minecraft:chest run return run function nuke:safe/drop

# Prevent either placement order from producing a double chest.
function nuke:safe/break_neighbors

# No player within six blocks: restore lock and clear temporary access.
execute unless entity @a[distance=..6] run function nuke:safe/seal
