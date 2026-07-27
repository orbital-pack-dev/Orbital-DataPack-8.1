# Контекст: as <marker tt_marker>, at @s.
scoreboard players remove @s tt_timer 1

# Блока нет — заряд сняли руками.
execute unless block ~ ~ ~ minecraft:tnt run return run function nuke:timer_tnt/defuse

# СМЫВ ВОДОЙ: проверяем ВСЕ 6 сторон блока.
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~-1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~1 minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~-1 minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~-1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

# Раз в секунду: текст, звук, частицы. Остальные 19 тиков — почти бесплатно.
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings
execute if score @s tt_mod matches 0 run function nuke:timer_tnt/second

execute if score @s tt_timer matches ..0 run function nuke:timer_tnt/detonate
