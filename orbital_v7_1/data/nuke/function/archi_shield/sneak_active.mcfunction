# Shift barrier: reverse hostile projectile velocity once, then pulse attackers.
particle minecraft:end_rod ~ ~1 ~ 1.6 1 1.6 10 0.02
title @s actionbar {"text":"АРХИ-ЩИТ: барьер активен","color":"aqua","bold":true}
execute as @e[type=minecraft:arrow,tag=!archi_reflected,distance=..4] run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:spectral_arrow,tag=!archi_reflected,distance=..4] run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:trident,tag=!archi_reflected,distance=..4] run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:fireball,tag=!archi_reflected,distance=..4] run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:small_fireball,tag=!archi_reflected,distance=..4] run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:wither_skull,tag=!archi_reflected,distance=..4] run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:dragon_fireball,tag=!archi_reflected,distance=..4] run function nuke:archi_shield/reflect_projectile

execute if score @s archi_delay matches 1.. run return 0
scoreboard players set @s archi_delay 100
execute if score nuke.cfg.archi_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = nuke.cfg.archi_cd nuke.settings
tag @s add archi_user
function nuke:archi_shield/knockback_and_thorns
tag @s remove archi_user
playsound minecraft:item.shield.block master @a[distance=..16] ~ ~ ~ 1 0.9
