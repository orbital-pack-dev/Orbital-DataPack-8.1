# Once per second: literal text, smoke, fire and audible tick.
scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
execute store result storage nuke:tt sec int 1 run scoreboard players get @s tt_seconds
execute as @e[type=minecraft:text_display,tag=tt_text,distance=..1.6,limit=1,sort=nearest] run function nuke:timer_tnt/set_text with storage nuke:tt
particle minecraft:smoke ~ ~0.6 ~ 0.22 0.08 0.22 6 0.015 force
particle minecraft:flame ~ ~0.55 ~ 0.12 0.06 0.12 3 0.01 force
playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1
execute if score @s tt_timer matches ..140 run playsound minecraft:block.wooden_button.click_on master @a ~ ~ ~ 1 2
