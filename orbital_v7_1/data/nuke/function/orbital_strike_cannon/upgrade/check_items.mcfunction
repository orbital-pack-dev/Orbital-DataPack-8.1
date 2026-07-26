scoreboard players set @s nuke.can_upgrade 1

execute store result score @s nuke.temp run clear @s blaze_rod 0
execute if score @s nuke.temp matches 0 run scoreboard players set @s nuke.can_upgrade 0

execute store result score @s nuke.temp run clear @s ghast_tear 0
execute if score @s nuke.temp matches 0 run scoreboard players set @s nuke.can_upgrade 0

execute store result score @s nuke.temp run clear @s spectral_arrow 0
execute if score @s nuke.temp matches 0 run scoreboard players set @s nuke.can_upgrade 0

execute store result score @s nuke.temp run clear @s tnt_minecart 0
execute if score @s nuke.temp matches 0 run scoreboard players set @s nuke.can_upgrade 0

execute store result score @s nuke.temp run clear @s nether_star 0
execute if score @s nuke.temp matches 0 run scoreboard players set @s nuke.can_upgrade 0

execute store result score @s nuke.temp run clear @s tnt 0
execute if score @s nuke.temp matches ..7 run scoreboard players set @s nuke.can_upgrade 0

execute store result score @s nuke.temp run clear @s blaze_powder 0
execute if score @s nuke.temp matches ..3 run scoreboard players set @s nuke.can_upgrade 0
