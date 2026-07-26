execute unless items entity @s weapon.offhand fishing_rod[custom_data~{nukeshot:1b}] run return 0
execute if score @s up_check matches 1.. run return 0

scoreboard players set @s up_check 20

execute if items entity @s weapon.offhand fishing_rod[custom_data~{nukeshot_power:4}] run title @s actionbar {"text":"NukeShot уже на Power-4.","color":"gold"}
execute if items entity @s weapon.offhand fishing_rod[custom_data~{nukeshot_power:4}] run return 0

scoreboard players set @s nuke.power 2
execute if items entity @s weapon.offhand fishing_rod[custom_data~{nukeshot_power:2}] run scoreboard players set @s nuke.power 3
execute if items entity @s weapon.offhand fishing_rod[custom_data~{nukeshot_power:3}] run scoreboard players set @s nuke.power 4

function nuke:orbital_strike_cannon/upgrade_nukeshot/check_items
execute if score @s nuke.can_upgrade matches 1 run function nuke:orbital_strike_cannon/upgrade_nukeshot/perform
execute if score @s nuke.can_upgrade matches 1 run return 0

execute if score @s up_msg matches 1.. run return 0
function nuke:orbital_strike_cannon/upgrade_nukeshot/missing_message
scoreboard players set @s up_msg 100
