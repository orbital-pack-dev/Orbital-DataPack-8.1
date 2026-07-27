# Context: initialized Timer-TNT marker. No summon and no recursion.
scoreboard players remove @s tt_timer 1

# Water in the charge cell or touching any of its six faces defuses it.
execute if block ~ ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~-1 ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~-1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~1 minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~-1 minecraft:water run return run function nuke:timer_tnt/defuse

execute unless entity @e[type=minecraft:block_display,tag=tt_display,distance=..1.6,limit=1] run return run function nuke:timer_tnt/cleanup

scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings
execute if score @s tt_mod matches 0 run function nuke:timer_tnt/second
execute if score @s tt_timer matches ..0 run function nuke:timer_tnt/detonate
