# Once per second: update literal text through storage macro, then effects.
scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
execute store result storage nuke:tt sec int 1 run scoreboard players get @s tt_seconds
execute as @e[type=minecraft:text_display,tag=tt_text,distance=..1.6,limit=1,sort=nearest] run function nuke:timer_tnt/set_text with storage nuke:tt
particle minecraft:smoke ~ ~0.6 ~ 0.2 0.05 0.2 4 0.01
playsound minecraft:block.note_block.hat master @a[distance=..24] ~ ~ ~ 1 1
execute if score @s tt_timer matches ..140 run playsound minecraft:block.wooden_button.click_on master @a[distance=..24] ~ ~ ~ 1 2
