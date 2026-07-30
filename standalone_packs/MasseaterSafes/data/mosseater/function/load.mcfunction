# MASSEATER SAFES — STANDALONE LOAD (Minecraft 1.21.11)
# Только безопасная инициализация. Gamerule и глобальные настройки чата
# намеренно не изменяются.

scoreboard objectives add mosseater.safe_config dummy
scoreboard objectives add mosseater.safe_data dummy
scoreboard objectives add mosseater.safe_key trigger
scoreboard objectives add mosseater.safe_cancel trigger

# МОДУЛЬ 2. Плотность застройки хранится прямо на маркере сейфа.
scoreboard objectives add ms_safe_neighbors dummy

# Дефолты переживают /reload: выставляются только если ещё не заданы.
execute unless score #lock_distance mosseater.safe_config matches 1.. run scoreboard players set #lock_distance mosseater.safe_config 4
execute unless score #raycast_steps mosseater.safe_config matches 1.. run scoreboard players set #raycast_steps mosseater.safe_config 40
execute unless score #density_timer mosseater.safe_config matches 0.. run scoreboard players set #density_timer mosseater.safe_config 60
execute unless score #window mosseater.safe_config matches 1.. run scoreboard players set #window mosseater.safe_config 60
scoreboard players set #merge_diff mosseater.safe_config 0
scoreboard players set #ready mosseater.safe_config 1

# Сброс только временных состояний. Пароли, marker state и содержимое сундуков
# не затрагиваются.
execute as @e[tag=ms_safe_shield,type=minecraft:interaction] run data remove entity @s interaction
tag @e[tag=ms_safe_clicked,type=minecraft:interaction] remove ms_safe_clicked
tag @e[tag=ms_safe_auth,type=minecraft:marker] remove ms_safe_auth
tag @a remove ms_safe_user
tag @a remove ms_safe_place_pending
tag @a remove ms_recipes
data remove storage mosseater:safe fx
data remove storage mosseater:safe merge
