# АПГРЕЙД NUKESHOT. Контекст: as <игрок>, at @s.
# ГЛАВНОЕ: апгрейд проверяется ТОЛЬКО по реальному действию игрока:
# шифт + правый клик удочкой. Простое удержание БОЛЬШЕ НИЧЕГО не спамит.
execute unless score @s use_rod matches 1.. run return 0
execute unless entity @s[predicate=nuke:is_sneaking] run return 0

scoreboard players set @s nuke.temp 0
execute if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] run scoreboard players set @s nuke.temp 1
execute if score @s nuke.temp matches 0 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] run scoreboard players set @s nuke.temp 2
execute if score @s nuke.temp matches 0 run return 0

# Жёсткий кулдаун на саму проверку.
execute if score @s up_check matches 1.. run return 0
scoreboard players set @s up_check 40

# Уже максимальный уровень.
execute if score @s nuke.temp matches 1 if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:4}] run return run title @s actionbar {"text":"NukeShot уже на Power-4.","color":"gold"}
execute if score @s nuke.temp matches 2 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:4}] run return run title @s actionbar {"text":"NukeShot уже на Power-4.","color":"gold"}

# Целевой уровень.
scoreboard players set @s nuke.power 2
execute if score @s nuke.temp matches 1 if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:2}] run scoreboard players set @s nuke.power 3
execute if score @s nuke.temp matches 1 if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:3}] run scoreboard players set @s nuke.power 4
execute if score @s nuke.temp matches 2 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:2}] run scoreboard players set @s nuke.power 3
execute if score @s nuke.temp matches 2 if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot_power:3}] run scoreboard players set @s nuke.power 4

function nuke:orbital_strike_cannon/upgrade_nukeshot/check_items
execute if score @s nuke.can_upgrade matches 1 run function nuke:orbital_strike_cannon/upgrade_nukeshot/perform
execute if score @s nuke.can_upgrade matches 1 run return 0

# Сообщение о нехватке — не чаще раза в 10 секунд.
execute if score @s up_msg matches 1.. run return 0
function nuke:orbital_strike_cannon/upgrade_nukeshot/missing_message
scoreboard players set @s up_msg 200
