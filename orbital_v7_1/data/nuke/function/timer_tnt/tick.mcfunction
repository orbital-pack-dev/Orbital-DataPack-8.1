scoreboard players set #20 nuke.settings 20
scoreboard players remove @e[type=minecraft:block_display,tag=tt_display,scores={tt_timer=1..}] tt_timer 1
execute as @e[type=minecraft:block_display,tag=tt_display] at @s run function nuke:timer_tnt/tick_one
execute as @e[type=minecraft:block_display,tag=tt_display,scores={tt_timer=..0}] at @s run function nuke:timer_tnt/detonate
