tellraw @s ["",{"text":"[NukeShot] ","color":"dark_red"},{"text":"Не хватает ресурсов для Power-","color":"yellow"},{"score":{"name":"@s","objective":"nuke.power"},"color":"yellow"},{"text":":","color":"yellow"}]

execute if score @s nuke.power matches 2 store result score @s nuke.temp run clear @s netherite_block 0
execute if score @s nuke.power matches 2 if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - Незеритовый блок x1","color":"gold"}]
execute if score @s nuke.power matches 2 store result score @s nuke.temp run clear @s nether_star 0
execute if score @s nuke.power matches 2 if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - Звезда Незера x1","color":"gold"}]
execute if score @s nuke.power matches 2 store result score @s nuke.temp run clear @s end_crystal 0
execute if score @s nuke.power matches 2 if score @s nuke.temp matches ..3 run tellraw @s ["",{"text":" - Кристалл Энда x4, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 2 store result score @s nuke.temp run clear @s wither_skeleton_skull 0
execute if score @s nuke.power matches 2 if score @s nuke.temp matches ..2 run tellraw @s ["",{"text":" - Череп визер-скелета x3, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 2 store result score @s nuke.temp run clear @s tnt 0
execute if score @s nuke.power matches 2 if score @s nuke.temp matches ..63 run tellraw @s ["",{"text":" - TNT x64, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]

execute if score @s nuke.power matches 3 store result score @s nuke.temp run clear @s netherite_block 0
execute if score @s nuke.power matches 3 if score @s nuke.temp matches ..2 run tellraw @s ["",{"text":" - Незеритовый блок x3, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 3 store result score @s nuke.temp run clear @s nether_star 0
execute if score @s nuke.power matches 3 if score @s nuke.temp matches ..1 run tellraw @s ["",{"text":" - Звезда Незера x2, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 3 store result score @s nuke.temp run clear @s end_crystal 0
execute if score @s nuke.power matches 3 if score @s nuke.temp matches ..7 run tellraw @s ["",{"text":" - Кристалл Энда x8, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 3 store result score @s nuke.temp run clear @s wither_skeleton_skull 0
execute if score @s nuke.power matches 3 if score @s nuke.temp matches ..5 run tellraw @s ["",{"text":" - Череп визер-скелета x6, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 3 store result score @s nuke.temp run clear @s tnt_minecart 0
execute if score @s nuke.power matches 3 if score @s nuke.temp matches ..15 run tellraw @s ["",{"text":" - TNT-вагонетка x16, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 3 store result score @s nuke.temp run clear @s ghast_tear 0
execute if score @s nuke.power matches 3 if score @s nuke.temp matches ..15 run tellraw @s ["",{"text":" - Слеза гаста x16, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]

execute if score @s nuke.power matches 4 store result score @s nuke.temp run clear @s netherite_block 0
execute if score @s nuke.power matches 4 if score @s nuke.temp matches ..5 run tellraw @s ["",{"text":" - Незеритовый блок x6, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 4 store result score @s nuke.temp run clear @s nether_star 0
execute if score @s nuke.power matches 4 if score @s nuke.temp matches ..3 run tellraw @s ["",{"text":" - Звезда Незера x4, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 4 store result score @s nuke.temp run clear @s end_crystal 0
execute if score @s nuke.power matches 4 if score @s nuke.temp matches ..15 run tellraw @s ["",{"text":" - Кристалл Энда x16, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 4 store result score @s nuke.temp run clear @s beacon 0
execute if score @s nuke.power matches 4 if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - Маяк x1","color":"gold"}]
execute if score @s nuke.power matches 4 store result score @s nuke.temp run clear @s dragon_breath 0
execute if score @s nuke.power matches 4 if score @s nuke.temp matches ..3 run tellraw @s ["",{"text":" - Драконье дыхание x4, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
execute if score @s nuke.power matches 4 store result score @s nuke.temp run clear @s tnt_minecart 0
execute if score @s nuke.power matches 4 if score @s nuke.temp matches ..15 run tellraw @s ["",{"text":" - TNT-вагонетка x16, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]
