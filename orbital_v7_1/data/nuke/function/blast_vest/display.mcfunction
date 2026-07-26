# Выполняется as игрок, at @s. ВНИМАНИЕ: bv_timer здесь НЕ уменьшается
# (именно второй декремент раньше гнал таймер вдвое быстрее).
scoreboard players set #20 nuke.settings 20
scoreboard players operation @s nuke.temp = @s bv_timer
scoreboard players operation @s nuke.temp /= #20 nuke.settings

title @s actionbar [{"text":"ПОДРЫВНОЙ ЖИЛЕТ: ","color":"red","bold":true},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow","bold":true},{"text":" сек","color":"gray","bold":false}]

scoreboard players operation @s nuke.power = @s bv_timer
scoreboard players operation @s nuke.power %= #20 nuke.settings

# Частицы задержки и тиканье — раз в секунду
execute if score @s nuke.power matches 0 run particle minecraft:smoke ~ ~1 ~ 0.3 0.4 0.3 6 0.01
execute if score @s nuke.power matches 0 run playsound minecraft:block.note_block.hat player @a[distance=..16] ~ ~ ~ 0.8 2

# Последние 5 секунд — частые щелчки, огонь и красный тайтл
execute if score @s nuke.temp matches ..5 run particle minecraft:flame ~ ~1 ~ 0.3 0.4 0.3 4 0.01
execute if score @s nuke.temp matches ..5 if score @s nuke.power matches 0 run playsound minecraft:block.wooden_button.click_on player @a[distance=..24] ~ ~ ~ 1 1.8
execute if score @s nuke.temp matches ..5 if score @s nuke.power matches 10 run playsound minecraft:block.wooden_button.click_on player @a[distance=..24] ~ ~ ~ 1 2
