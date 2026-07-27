# Контекст: as <marker tt_marker>, at @s.
scoreboard players remove @s tt_timer 1

# Секунды в текст над блоком — одной командой.
scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
scoreboard players operation @e[type=minecraft:text_display,tag=tt_text,distance=..3] tt_seconds = @s tt_seconds

particle minecraft:smoke ~ ~0.6 ~ 0.15 0.05 0.15 2 0.01

# Блок убрали/смыло водой — заряд обезврежен.
execute unless block ~ ~ ~ minecraft:tnt run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

# Щёлчок раз в секунду.
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings
execute if score @s tt_mod matches 0 run playsound minecraft:block.note_block.hat master @a[distance=..24] ~ ~ ~ 1 1
execute if score @s tt_mod matches 0 if score @s tt_timer matches ..140 run playsound minecraft:block.wooden_button.click_on master @a[distance=..24] ~ ~ ~ 1 2

execute if score @s tt_timer matches ..0 run function nuke:timer_tnt/detonate
