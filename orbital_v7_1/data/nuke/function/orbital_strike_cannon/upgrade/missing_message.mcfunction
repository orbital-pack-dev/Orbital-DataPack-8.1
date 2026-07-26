tellraw @s ["",{"text":"[STAB -> NUKE] ","color":"dark_gray"},{"text":"Не хватает ресурсов:","color":"yellow"}]

execute store result score @s nuke.temp run clear @s blaze_rod 0
execute if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - Огненный стержень x1","color":"gold"}]

execute store result score @s nuke.temp run clear @s ghast_tear 0
execute if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - Слеза гаста x1","color":"gold"}]

execute store result score @s nuke.temp run clear @s spectral_arrow 0
execute if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - Спектральная стрела x1","color":"gold"}]

execute store result score @s nuke.temp run clear @s tnt 0
execute if score @s nuke.temp matches ..7 run tellraw @s ["",{"text":" - TNT x8, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]

execute store result score @s nuke.temp run clear @s tnt_minecart 0
execute if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - TNT-вагонетка x1","color":"gold"}]

execute store result score @s nuke.temp run clear @s blaze_powder 0
execute if score @s nuke.temp matches ..3 run tellraw @s ["",{"text":" - Огненный порошок x4, есть: ","color":"gold"},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow"}]

execute store result score @s nuke.temp run clear @s nether_star 0
execute if score @s nuke.temp matches 0 run tellraw @s ["",{"text":" - Звезда Незера x1","color":"gold"}]
