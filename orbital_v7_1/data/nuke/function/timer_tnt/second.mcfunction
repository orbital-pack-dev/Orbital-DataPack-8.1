# Called once per second by each tt_marker.
scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
execute store result storage nuke:tt sec int 1 run scoreboard players get @s tt_seconds
execute as @e[type=minecraft:text_display,tag=tt_text,distance=..1.6,limit=1,sort=nearest] run function nuke:timer_tnt/set_text with storage nuke:tt
execute at @s run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1
execute at @s run particle minecraft:smoke ~ ~0.6 ~ 0.1 0.1 0.1 0.01 5 force
execute at @s run particle minecraft:flame ~ ~0.55 ~ 0.08 0.08 0.08 0.01 2 force
execute if score @s tt_timer matches ..140 at @s run playsound minecraft:block.wooden_button.click_on master @a ~ ~ ~ 1 2
