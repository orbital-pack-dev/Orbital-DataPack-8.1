# Context: Safe marker at its chest.
execute unless block ~ ~ ~ minecraft:chest run return run function nuke:safe/drop
function nuke:safe/break_neighbors

# Игрок ближе 4 блоков — скрываем только рабочий guard, чтобы UI сундука был кликабелен.
execute if entity @a[distance=..4] run kill @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3]

# ОТСЛЕЖИВАНИЕ ИГРОКА: как только все игроки отошли дальше 4 блоков —
# сейф автоматически запечатывается (возврат компонента lock) и interaction
# возвращается на блок с корректными габаритами (1.2×1.2 или 2.2×2.2).
execute unless entity @a[distance=..4] run function nuke:safe/seal
execute unless entity @a[distance=..4] run function nuke:safe/ensure_interaction
