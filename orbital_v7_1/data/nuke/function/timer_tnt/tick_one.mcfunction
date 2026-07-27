# Контекст: as <marker tt_marker>, at @s. НИКАКИХ setblock и summon тут нет.
scoreboard players remove @s tt_timer 1

# Смыв водой: вода в клетке заряда или сверху.
execute if block ~ ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

# Визуал уничтожили — заряд больше не существует.
execute unless entity @e[type=minecraft:block_display,tag=tt_display,distance=..2] run return run function nuke:timer_tnt/defuse

# Раз в секунду: текст, звук, частицы.
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings
execute if score @s tt_mod matches 0 run function nuke:timer_tnt/second

execute if score @s tt_timer matches ..0 run function nuke:timer_tnt/detonate
