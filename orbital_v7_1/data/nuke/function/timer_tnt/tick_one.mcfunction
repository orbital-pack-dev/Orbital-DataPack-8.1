# Выполняется as block_display, at @s (угол блока)

# 1) СМЫВ ВОДОЙ — стандартная проверка блока на самой позиции заряда.
execute if block ~ ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~ minecraft:bubble_column run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

# 2) Заряд залили/застроили другим блоком — тоже сбрасываем в предмет.
execute unless block ~ ~ ~ #minecraft:replaceable run return run function nuke:timer_tnt/defuse

# 3) Хитбокс потерялся (выгрузка чанка, /kill) — восстанавливаем.
execute unless entity @e[type=minecraft:armor_stand,tag=tt_hitbox,distance=..2] run summon minecraft:armor_stand ~0.5 ~ ~0.5 {Tags:["tt_hitbox"],Marker:0b,Invisible:1b,Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,Silent:1b,PersistenceRequired:1b,DisabledSlots:4144959}

# 4) Секунды и остаток от деления на 20
scoreboard players operation @s tt_seconds = @s tt_timer
scoreboard players operation @s tt_seconds /= #20 nuke.settings
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings

# 5) Текст таймера и звук щелчка — ровно раз в секунду
execute if score @s tt_mod matches 0 run function nuke:timer_tnt/update_text
execute if score @s tt_mod matches 0 run playsound minecraft:block.note_block.hat block @a[distance=..12] ~0.5 ~0.6 ~0.5 0.7 2

# 6) Частицы ровно по центру блока
particle minecraft:smoke ~0.5 ~1.05 ~0.5 0.15 0 0.15 2 0.01
execute if score @s tt_seconds matches ..10 run particle minecraft:flame ~0.5 ~1.05 ~0.5 0.12 0 0.12 2 0.01

# 7) Финальный отсчёт: частые щелчки последние 7 секунд
execute if score @s tt_seconds matches 1..7 if score @s tt_mod matches 0 run playsound minecraft:block.wooden_button.click_on block @a[distance=..24] ~0.5 ~0.6 ~0.5 1 1.6
execute if score @s tt_seconds matches 1..7 if score @s tt_mod matches 10 run playsound minecraft:block.wooden_button.click_on block @a[distance=..24] ~0.5 ~0.6 ~0.5 1 2
