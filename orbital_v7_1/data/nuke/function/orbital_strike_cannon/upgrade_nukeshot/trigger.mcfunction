# АПГРЕЙД NUKESHOT. Контекст: as <игрок>, at @s.
# nuke.temp = в какой руке удочка: 1 = mainhand, 2 = offhand.
# Раньше проверялся ТОЛЬКО offhand — поэтому Power-2..4 не выдавались.
scoreboard players set @s nuke.temp 0
execute if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] run scoreboard players set @s nuke.temp 1
execute if score @s nuke.temp matches 0 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] run scoreboard players set @s nuke.temp 2
execute if score @s nuke.temp matches 0 run return 0

execute if score @s up_check matches 1.. run return 0
scoreboard players set @s up_check 20

# Уже максимальный уровень.
execute if score @s nuke.temp matches 1 if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:4}] run return run title @s actionbar {"text":"NukeShot уже на Power-4.","color":"gold"}
execute if score @s nuke.temp matches 2 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:4}] run return run title @s actionbar {"text":"NukeShot уже на Power-4.","color":"gold"}

# Определяем целевой уровень.
scoreboard players set @s nuke.power 2
execute if score @s nuke.temp matches 1 if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:2}] run scoreboard players set @s nuke.power 3
execute if score @s nuke.temp matches 1 if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:3}] run scoreboard players set @s nuke.power 4
execute if score @s nuke.temp matches 2 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:2}] run scoreboard players set @s nuke.power 3
execute if score @s nuke.temp matches 2 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:3}] run scoreboard players set @s nuke.power 4

function nuke:orbital_strike_cannon/upgrade_nukeshot/check_items
execute if score @s nuke.can_upgrade matches 1 run function nuke:orbital_strike_cannon/upgrade_nukeshot/perform
execute if score @s nuke.can_upgrade matches 1 run return 0

execute if score @s up_msg matches 1.. run return 0
function nuke:orbital_strike_cannon/upgrade_nukeshot/missing_message
scoreboard players set @s up_msg 100
