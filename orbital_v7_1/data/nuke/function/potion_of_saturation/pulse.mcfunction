# Выполняется as игрок с sat_pulse>0 (из nuke:tick)
scoreboard players set #20 nuke.settings 20
scoreboard players operation @s nuke.temp = @s sat_pulse
scoreboard players operation @s nuke.temp %= #20 nuke.settings
execute if score @s nuke.temp matches 0 run effect give @s minecraft:saturation 1 0 true
