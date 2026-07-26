# АРХИ-ЩИТ, активный режим (шифт). Контекст: as игрок, at игрок.
# Стена частиц пульсирует раз в 4 тика.
scoreboard players set #four nuke.settings 4
scoreboard players operation @s nuke.temp = @s sneak_time
scoreboard players operation @s nuke.temp %= #four nuke.settings

execute if score @s nuke.temp matches 0 rotated as @s positioned ^-1.2 ^0.5 ^2 run particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^-0.6 ^0.5 ^2 run particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^0 ^0.5 ^2 run particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^0.6 ^0.5 ^2 run particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^1.2 ^0.5 ^2 run particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^-1.2 ^1.3 ^2 run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^-0.6 ^1.3 ^2 run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^0 ^1.3 ^2 run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^0.6 ^1.3 ^2 run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force
execute if score @s nuke.temp matches 0 rotated as @s positioned ^1.2 ^1.3 ^2 run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 force

# Владелец щита помечается, чтобы урон и отбрасывание засчитывались ему.
tag @s add archi_user
execute rotated as @s positioned ^ ^1 ^1.5 as @e[distance=..3.5,type=!player,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!area_effect_cloud,type=!experience_orb,type=!armor_stand,type=!firework_rocket] at @s run function nuke:archi_shield/knockback_and_thorns
tag @s remove archi_user
