execute if score @s nuke.power matches 2 run clear @s netherite_block 1
execute if score @s nuke.power matches 2 run clear @s nether_star 1
execute if score @s nuke.power matches 2 run clear @s end_crystal 4
execute if score @s nuke.power matches 2 run clear @s wither_skeleton_skull 3
execute if score @s nuke.power matches 2 run clear @s tnt 64
execute if score @s nuke.power matches 2 run item replace entity @s weapon.offhand with fishing_rod[custom_data={nukeshot:1b,nukeshot_power:2,power_level:2,nukeshot_p2:1b,power_tag:"power_2"},custom_model_data={floats:[1002f]},custom_name={"italic":false,"color":"red","text":"NukeShot | Power-2"},rarity="rare",damage=63]

execute if score @s nuke.power matches 3 run clear @s netherite_block 3
execute if score @s nuke.power matches 3 run clear @s nether_star 2
execute if score @s nuke.power matches 3 run clear @s end_crystal 8
execute if score @s nuke.power matches 3 run clear @s wither_skeleton_skull 6
execute if score @s nuke.power matches 3 run clear @s tnt_minecart 16
execute if score @s nuke.power matches 3 run clear @s ghast_tear 16
execute if score @s nuke.power matches 3 run item replace entity @s weapon.offhand with fishing_rod[custom_data={nukeshot:1b,nukeshot_power:3,power_level:3,nukeshot_p3:1b,power_tag:"power_3"},custom_model_data={floats:[1003f]},custom_name={"italic":false,"color":"dark_red","text":"NukeShot | Power-3"},rarity="epic",damage=63]

execute if score @s nuke.power matches 4 run clear @s netherite_block 6
execute if score @s nuke.power matches 4 run clear @s nether_star 4
execute if score @s nuke.power matches 4 run clear @s end_crystal 16
execute if score @s nuke.power matches 4 run clear @s beacon 1
execute if score @s nuke.power matches 4 run clear @s dragon_breath 4
execute if score @s nuke.power matches 4 run clear @s tnt_minecart 16
execute if score @s nuke.power matches 4 run item replace entity @s weapon.offhand with fishing_rod[custom_data={nukeshot:1b,nukeshot_power:4,power_level:4,nukeshot_p4:1b,power_tag:"power_4"},custom_model_data={floats:[1004f]},custom_name={"italic":false,"color":"dark_red","text":"NukeShot | Power-4"},rarity="epic",damage=63]

particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0 100 force
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 1 force
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.8 1.4
tellraw @s ["",{"text":"[NukeShot] ","color":"dark_red"},{"text":"Улучшение выполнено: Power-","color":"gold"},{"score":{"name":"@s","objective":"nuke.power"},"color":"yellow"},{"text":".","color":"gold"}]

scoreboard players reset @s up_msg
