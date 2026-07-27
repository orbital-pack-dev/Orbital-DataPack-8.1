# Контекст: as <block_display tt_display>, at @s.
scoreboard players remove @s tt_timer 1

# Секунды и передача их в text_display — одна простая команда, без макросов.
scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
scoreboard players operation @e[type=minecraft:text_display,tag=tt_text,distance=..3] tt_seconds = @s tt_seconds

# ПОСТОЯННЫЕ частицы от маркера.
execute at @e[type=minecraft:marker,tag=tt_marker,distance=..3,limit=1] run particle minecraft:smoke ~ ~0.6 ~ 0.15 0.05 0.15 2 0.01
execute if score @s tt_timer matches ..200 at @e[type=minecraft:marker,tag=tt_marker,distance=..3,limit=1] run particle minecraft:flame ~ ~0.6 ~ 0.2 0.1 0.2 3 0.01

# СМЫВ ВОДОЙ.
execute if block ~ ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~ minecraft:bubble_column run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

# ЩЁЛКАНЬЕ РАЗ В СЕКУНДУ.
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings
execute if score @s tt_mod matches 0 at @e[type=minecraft:marker,tag=tt_marker,distance=..3,limit=1] run playsound minecraft:block.note_block.hat master @a[distance=..24] ~ ~ ~ 1 1
execute if score @s tt_mod matches 0 if score @s tt_timer matches ..140 at @e[type=minecraft:marker,tag=tt_marker,distance=..3,limit=1] run playsound minecraft:block.wooden_button.click_on master @a[distance=..24] ~ ~ ~ 1 2
execute if score @s tt_mod matches 10 if score @s tt_timer matches ..140 at @e[type=minecraft:marker,tag=tt_marker,distance=..3,limit=1] run playsound minecraft:block.wooden_button.click_on master @a[distance=..24] ~ ~ ~ 1 2

execute if score @s tt_timer matches ..0 run function nuke:timer_tnt/detonate
