scoreboard players set @s use_rod 0

execute unless items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] unless items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] unless items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] run return 0

execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] if score @s stab_delay matches 1.. run title @s actionbar {"text":"STAB: перезарядка","color":"gold"}
execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] if score @s stab_delay matches 1.. run return 0

execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] if score @s nuke_delay matches 1.. run title @s actionbar {"text":"NUKE: перезарядка","color":"red"}
execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] if score @s nuke_delay matches 1.. run return 0

execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] if score @s wither_delay matches 1.. run title @s actionbar {"text":"WITHER-SHOT: перезарядка","color":"dark_purple"}
execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] if score @s wither_delay matches 1.. run return 0


function nuke:orbital_strike_cannon/rod/use_rod
