scoreboard players set @s nuke.action_ok 0

execute if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] run scoreboard players operation @s nuke.xp_cost = nuke.cfg.xp_stab nuke.settings
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] run scoreboard players operation @s nuke.xp_cost = nuke.cfg.xp_nuke nuke.settings
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] run scoreboard players operation @s nuke.xp_cost = nuke.cfg.xp_wither nuke.settings

execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] store result score @s nuke.temp run clear @s wither_skeleton_skull 0
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] if score @s nuke.temp matches ..2 run title @s actionbar {"text":"WITHER-SHOT: нужны черепа визер-скелета x3","color":"dark_purple"}
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] if score @s nuke.temp matches ..2 run return 0
# Защита от потери XP и предметов, если волна уже активна
scoreboard players set nuke.bd_count nuke.temp 0
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] as @e[type=block_display,tag=stabshot] run scoreboard players add nuke.bd_count nuke.temp 1
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] if score nuke.bd_count nuke.temp matches 3.. run title @s actionbar {"text":"⛔ Уже активны 3 STAB-удара, подождите!","color":"gold"}
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] if score nuke.bd_count nuke.temp matches 3.. run return 0

execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] as @e[type=block_display,tag=nukeshot] run scoreboard players add nuke.bd_count nuke.temp 1
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] if score nuke.bd_count nuke.temp matches 1.. run title @s actionbar {"text":"⛔ Волна NUKE ещё активна (~27 сек), подождите!","color":"red"}
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] if score nuke.bd_count nuke.temp matches 1.. run return 0

execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] as @e[type=block_display,tag=withershot] run scoreboard players add nuke.bd_count nuke.temp 1
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] if score nuke.bd_count nuke.temp matches 1.. run title @s actionbar {"text":"⛔ Залп WITHER-SHOT ещё активен, подождите!","color":"dark_purple"}
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] if score nuke.bd_count nuke.temp matches 1.. run return 0

function nuke:check_xp
execute unless score @s nuke.action_ok matches 1 run return 0

execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] run scoreboard players operation @s stab_delay = nuke.cfg.stab_cd nuke.settings
execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] run scoreboard players operation @s nuke_delay = nuke.cfg.nuke_cd nuke.settings
execute if score personal_cd nuke.settings matches 1.. if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] run scoreboard players operation @s wither_delay = nuke.cfg.wither_cd nuke.settings


scoreboard players reset @s raycast_limit

playsound item.shield.break player @a[distance=..10] ~ ~ ~ 30 1

execute if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] anchored eyes run function nuke:orbital_strike_cannon/raycast/stabshot/raycast
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] anchored eyes run function nuke:orbital_strike_cannon/raycast/nukeshot/raycast
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] anchored eyes run function nuke:orbital_strike_cannon/raycast/wither_shot/raycast

execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] run clear @s wither_skeleton_skull 3
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] run advancement grant @s only nuke:orbital_complex/fire_withershot

execute if items entity @s weapon.mainhand fishing_rod[custom_data~{stabshot:1b}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{nukeshot:1b}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.mainhand fishing_rod[custom_data~{withershot:1b}] run item replace entity @s weapon.mainhand with air
