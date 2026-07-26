# Обработка таймера-ТНТ
scoreboard players remove @e[type=block_display,tag=tt_display,scores={tt_timer=1..}] tt_timer 1

# Звуки обратного отсчёта (каждые 10 сек)
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=600}] at @s run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=300}] at @s run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=120}] at @s run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=60}] at @s run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=40}] at @s run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=20}] at @s run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=10}] at @s run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0

# Вычисление секунд для отображения
scoreboard players set #20 nuke.settings 20
execute as @e[type=block_display,tag=tt_display] run scoreboard players operation @s tt_seconds = @s tt_timer
execute as @e[type=block_display,tag=tt_display] run scoreboard players operation @s tt_seconds /= #20 nuke.settings

# Частицы дыма пока идёт обратный отсчёт
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=1..}] at @s run particle smoke ~ ~0.8 ~ 0.2 0.5 0.2 0.02 2

# Обезвреживание водой
execute as @e[type=block_display,tag=tt_display] at @s if block ~ ~ ~ water run function nuke:timer_tnt/defuse
execute as @e[type=block_display,tag=tt_display] at @s if block ~ ~1 ~ water run function nuke:timer_tnt/defuse

# Детонация при достижении нуля
execute as @e[type=block_display,tag=tt_display,scores={tt_timer=0}] at @s run function nuke:timer_tnt/detonate
