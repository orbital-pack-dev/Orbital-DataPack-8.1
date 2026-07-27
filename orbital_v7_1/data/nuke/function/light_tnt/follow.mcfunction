# Context: one Light-TNT wind charge at its exact coordinates.
tag @s add lt_current_projectile
# ФИКС: во всех трёх сравнениях `if score ... = @e[...]` отсутствовало имя
# objective у правого операнда (nuke.pid) — команда не парсилась, функция
# не загружалась, дисплей не получал lt_has_projectile и детонировал сразу.
execute as @e[type=minecraft:block_display,tag=lt_display] if score @s nuke.pid = @e[type=minecraft:wind_charge,tag=lt_current_projectile,limit=1] nuke.pid run tp @s ~ ~ ~
execute as @e[type=minecraft:block_display,tag=lt_display] if score @s nuke.pid = @e[type=minecraft:wind_charge,tag=lt_current_projectile,limit=1] nuke.pid run tag @s add lt_has_projectile
execute as @e[type=minecraft:block_display,tag=lt_display,tag=lt_has_projectile] if score @s nuke.pid = @e[type=minecraft:wind_charge,tag=lt_current_projectile,limit=1] nuke.pid at @s run tp @s ~ ~ ~ ~25 ~12
tag @s remove lt_current_projectile
