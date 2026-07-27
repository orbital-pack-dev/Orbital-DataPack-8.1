# Context: one grounded Timer-TNT item entity.
execute if entity @s[tag=tt_init] run return 0
tag @s add tt_init
execute if block ~ ~ ~ minecraft:water run return 0

scoreboard players set #tt_hours nuke.settings 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set #tt_hours nuke.settings 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set #tt_hours nuke.settings 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set #tt_hours nuke.settings 4

execute align xyz positioned ~0.5 ~0.5 ~0.5 run function nuke:timer_tnt/place
kill @s
