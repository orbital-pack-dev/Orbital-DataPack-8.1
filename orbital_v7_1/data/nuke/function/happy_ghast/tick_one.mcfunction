# Any positive HurtTime means this carrier took damage.
execute if score @s ghast_tnt matches 15.. run scoreboard players set @s ghast_tnt 14
execute store result score @s nuke.temp run data get entity @s HurtTime
execute if score @s nuke.temp matches 1.. run function nuke:happy_ghast/blow_prepare
particle minecraft:smoke ~ ~-0.4 ~ 0.5 0.3 0.5 2 0.01
