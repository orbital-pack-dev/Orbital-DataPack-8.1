# Энергетический барьер. Контекст: as <игрок>, at @s.
particle minecraft:end_rod ~ ~1 ~ 1.6 1 1.6 0.02 14 force
particle minecraft:electric_spark ~ ~1 ~ 1.3 0.8 1.3 0.02 10 force
title @s actionbar {"text":"✦ АРХИ-ЩИТ: БАРЬЕР АКТИВЕН ✦","color":"aqua","bold":true}

# Отражение ВСЕХ летящих снарядов в радиусе 4 блоков.
# Контекст переносится на сам снаряд (as + at @s), чтобы звук/частицы шли из точки отражения.
execute as @e[type=minecraft:arrow,tag=!archi_reflected,distance=..4] at @s run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:spectral_arrow,tag=!archi_reflected,distance=..4] at @s run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:trident,tag=!archi_reflected,distance=..4] at @s run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:fireball,tag=!archi_reflected,distance=..4] at @s run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:small_fireball,tag=!archi_reflected,distance=..4] at @s run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:wither_skull,tag=!archi_reflected,distance=..4] at @s run function nuke:archi_shield/reflect_projectile
execute as @e[type=minecraft:dragon_fireball,tag=!archi_reflected,distance=..4] at @s run function nuke:archi_shield/reflect_projectile

# ФИЗИЧЕСКАЯ АТАКА ПРИ SHIFT (возвращена).
# Владелец помечается тегом archi_user, чтобы урон был именно от него
# (иначе сервер не засчитает убийство и не выдаст лут).
tag @s add archi_user
execute as @e[distance=0.1..3.5,type=!minecraft:player,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud,type=!minecraft:armor_stand,tag=!display_solid_wall,tag=!safe_guard] at @s run function nuke:archi_shield/sneak_push
execute as @a[distance=0.1..3.5,tag=!archi_user] at @s run function nuke:archi_shield/sneak_push
tag @s remove archi_user
