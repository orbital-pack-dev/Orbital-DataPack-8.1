# ВЫДАЧА АПГРЕЙДА. Сначала убираем старую удочку, потом ПРЯМОЙ give.
# Никаких item replace по слотам — именно они теряли предмет.

execute if score @s nuke.power matches 2 run clear @s netherite_block 1
execute if score @s nuke.power matches 2 run clear @s nether_star 1
execute if score @s nuke.power matches 2 run clear @s end_crystal 4
execute if score @s nuke.power matches 2 run clear @s wither_skeleton_skull 3
execute if score @s nuke.power matches 2 run clear @s tnt 64
execute if score @s nuke.power matches 2 run clear @s minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] 1
execute if score @s nuke.power matches 2 run function nuke:give/nukeshot_p2

execute if score @s nuke.power matches 3 run clear @s netherite_block 3
execute if score @s nuke.power matches 3 run clear @s nether_star 2
execute if score @s nuke.power matches 3 run clear @s end_crystal 8
execute if score @s nuke.power matches 3 run clear @s wither_skeleton_skull 6
execute if score @s nuke.power matches 3 run clear @s tnt_minecart 16
execute if score @s nuke.power matches 3 run clear @s ghast_tear 16
execute if score @s nuke.power matches 3 run clear @s minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] 1
execute if score @s nuke.power matches 3 run function nuke:give/nukeshot_p3

execute if score @s nuke.power matches 4 run clear @s netherite_block 6
execute if score @s nuke.power matches 4 run clear @s nether_star 4
execute if score @s nuke.power matches 4 run clear @s end_crystal 16
execute if score @s nuke.power matches 4 run clear @s beacon 1
execute if score @s nuke.power matches 4 run clear @s dragon_breath 4
execute if score @s nuke.power matches 4 run clear @s tnt_minecart 16
execute if score @s nuke.power matches 4 run clear @s minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] 1
execute if score @s nuke.power matches 4 run function nuke:give/nukeshot_p4

particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0 100 force
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 1 force
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.8 1.4
tellraw @s ["",{"text":"[NukeShot] ","color":"dark_red"},{"text":"Улучшение выполнено: Power-","color":"gold"},{"score":{"name":"@s","objective":"nuke.power"},"color":"yellow"},{"text":".","color":"gold"}]

scoreboard players reset @s up_msg
