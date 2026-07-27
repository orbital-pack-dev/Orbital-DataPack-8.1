# Shift barrier: destroy hostile projectiles and pulse nearby attackers.
particle minecraft:end_rod ~ ~1 ~ 1.6 1 1.6 10 0.02
title @s actionbar {"text":"АРХИ-ЩИТ: барьер активен","color":"aqua","bold":true}
kill @e[type=minecraft:arrow,distance=..4]
kill @e[type=minecraft:spectral_arrow,distance=..4]
kill @e[type=minecraft:fireball,distance=..4]
kill @e[type=minecraft:small_fireball,distance=..4]
kill @e[type=minecraft:wither_skull,distance=..4]
kill @e[type=minecraft:dragon_fireball,distance=..4]
kill @e[type=minecraft:shulker_bullet,distance=..4]

execute if score @s archi_delay matches 1.. run return 0
scoreboard players set @s archi_delay 100
execute if score nuke.cfg.archi_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = nuke.cfg.archi_cd nuke.settings
tag @s add archi_user
function nuke:archi_shield/knockback_and_thorns
tag @s remove archi_user
playsound minecraft:item.shield.block master @a[distance=..16] ~ ~ ~ 1 0.9
