# Mounted block displays follow their owner without per-tick teleport searches.
execute if score @s ghast_tnt matches 15.. run scoreboard players set @s ghast_tnt 14
execute if data entity @s {HurtTime:9s} run function nuke:happy_ghast/blow_prepare
particle minecraft:smoke ~ ~-0.4 ~ 0.5 0.3 0.5 2 0.01
