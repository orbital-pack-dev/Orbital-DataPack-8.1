execute unless items entity @s weapon.offhand fishing_rod[custom_data~{stabshot:1b}] run return 0
execute if score @s up_check matches 1.. run return 0

scoreboard players set @s up_check 20
function nuke:orbital_strike_cannon/upgrade/check_items

execute if score @s nuke.can_upgrade matches 1 run function nuke:orbital_strike_cannon/upgrade/perform
execute if score @s nuke.can_upgrade matches 1 run return 0

execute if score @s up_msg matches 1.. run return 0
function nuke:orbital_strike_cannon/upgrade/missing_message
scoreboard players set @s up_msg 100
