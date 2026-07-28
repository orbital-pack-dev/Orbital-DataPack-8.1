# Context: Safe marker at its chest.
execute unless block ~ ~ ~ minecraft:chest run return run function nuke:safe/drop
function nuke:safe/break_neighbors

# Игрок ближе 4 блоков — скрываем только рабочий guard, чтобы UI сундука был кликабелен.
execute if entity @a[distance=..4] run kill @e[type=minecraft:interaction,tag=safe_guard,distance=..1.6]

# СЛЕЖЕНИЕ ЗА ИГРОКОМ: как только ближайший игрок отошёл дальше 4 блоков —
# принудительно вызываем safe/seal: возвращается замок И заново ставится interaction.
execute unless entity @a[distance=..4] run function nuke:safe/seal
