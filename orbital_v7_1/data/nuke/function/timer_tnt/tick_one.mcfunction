# Контекст: as <block_display tt_display>, at @s.
scoreboard players remove @s tt_timer 1

# Хитбокс всегда на месте (если его убили или чанк выгружался).
execute unless entity @e[type=minecraft:armor_stand,tag=tt_hitbox,distance=..1.5] run summon minecraft:armor_stand ~0.5 ~ ~0.5 {Tags:["tt_hitbox"],Invisible:1b,Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,Silent:1b,PersistenceRequired:1b,CustomNameVisible:1b,CustomName:{text:"ТАЙМЕР-ТНТ",color:"red",bold:true}}

# ПОСТОЯННЫЕ частицы — каждый тик, по центру блока.
particle minecraft:smoke ~0.5 ~1.05 ~0.5 0.15 0.05 0.15 2 0.01
execute if score @s tt_timer matches ..200 run particle minecraft:flame ~0.5 ~1.05 ~0.5 0.2 0.1 0.2 3 0.01

# СМЫВ ВОДОЙ — самая простая ванильная проверка блока.
execute if block ~ ~ ~ minecraft:water run return run function nuke:timer_tnt/defuse
execute if block ~ ~ ~ minecraft:bubble_column run return run function nuke:timer_tnt/defuse
execute if block ~ ~1 ~ minecraft:water run return run function nuke:timer_tnt/defuse

# Раз в секунду: текст и щёлчок.
scoreboard players operation @s tt_mod = @s tt_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings
execute if score @s tt_mod matches 0 run function nuke:timer_tnt/update_text
execute if score @s tt_mod matches 0 run playsound minecraft:block.note_block.hat block @a[distance=..24] ~ ~ ~ 1 1.5
execute if score @s tt_mod matches 0 if score @s tt_timer matches ..140 run playsound minecraft:block.wooden_button.click_on block @a[distance=..24] ~ ~ ~ 1 2
execute if score @s tt_mod matches 10 if score @s tt_timer matches ..140 run playsound minecraft:block.wooden_button.click_on block @a[distance=..24] ~ ~ ~ 1 2

execute if score @s tt_timer matches ..0 run function nuke:timer_tnt/detonate
