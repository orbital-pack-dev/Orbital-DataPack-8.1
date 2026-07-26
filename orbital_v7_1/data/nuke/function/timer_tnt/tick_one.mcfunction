# @s = block_display заряда, позиция = угол блока.
# Смывание водой: заряд выпадает предметом того же уровня.
execute if block ~1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~-1 ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~1 minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~-1 minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings

# Подпись обновляется раз в секунду, а не каждый тик.
execute if score @s tt_mod matches 0 run function nuke:timer_tnt/update_text

# Частицы строго по центру блока.
particle minecraft:smoke ~0.5 ~1.05 ~0.5 0.12 0.02 0.12 0.01 2

execute if score @s tt_timer matches 600 run playsound minecraft:block.note_block.bit block @a ~0.5 ~0.5 ~0.5 2 0.8
execute if score @s tt_timer matches 300 run playsound minecraft:block.note_block.bit block @a ~0.5 ~0.5 ~0.5 2 1.0
execute if score @s tt_timer matches 120 run playsound minecraft:block.note_block.bit block @a ~0.5 ~0.5 ~0.5 2 1.2
execute if score @s tt_timer matches 60 run playsound minecraft:block.note_block.bit block @a ~0.5 ~0.5 ~0.5 2 1.4
execute if score @s tt_timer matches 40 run playsound minecraft:block.note_block.bit block @a ~0.5 ~0.5 ~0.5 2 1.6
execute if score @s tt_timer matches 20 run playsound minecraft:block.note_block.bit block @a ~0.5 ~0.5 ~0.5 2 1.8
execute if score @s tt_timer matches 10 run playsound minecraft:block.note_block.bit block @a ~0.5 ~0.5 ~0.5 2 2.0
