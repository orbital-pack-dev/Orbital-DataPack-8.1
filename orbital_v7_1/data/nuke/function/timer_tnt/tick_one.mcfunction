# Контекст: as <block_display заряда>, at @s (угол блока).

# Смывание водой: барьер не даёт воде войти в сам блок, поэтому смотрим соседей.
execute if block ~1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~-1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~1 minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~-1 minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

# Если барьер каким-то образом исчез — заряд возвращается предметом, а не висит в воздухе.
execute unless block ~ ~ ~ minecraft:barrier run return run function nuke:timer_tnt/defuse

scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings

# Надпись перестраивается раз в секунду, а не каждый тик.
execute if score @s tt_mod matches 0 run function nuke:timer_tnt/update_text

# Частицы — ровно над центром блока.
particle minecraft:smoke ~0.5 ~1.05 ~0.5 0.12 0 0.12 2 0.01
execute if score @s tt_seconds matches 1..7 if score @s tt_mod matches 0 run particle minecraft:flame ~0.5 ~1.05 ~0.5 0.15 0 0.15 6 0.01
execute if score @s tt_seconds matches 1..7 if score @s tt_mod matches 0 run playsound minecraft:block.note_block.pling block @a[distance=..24] ~0.5 ~0.5 ~0.5 1 2
