# MASSEATER SAFES — STANDALONE LOAD (Minecraft 1.21.11)
# Автономный пак не использует ни одного скорборда из nuke.*

# Конфигурация сейфов (глобальные держатели #...).
scoreboard objectives add mosseater.safe_config dummy
# Рабочие данные (рейкаст, служебные счётчики игрока).
scoreboard objectives add mosseater.safe_data dummy
# Отдельное окно авторизации владельца: не смешивается с rearm interaction.
scoreboard objectives add mosseater.safe_auth dummy

# Триггеры диалога настройки (объектив типа trigger обязателен для /trigger).
scoreboard objectives add mosseater.safe_key trigger
scoreboard objectives add mosseater.safe_cancel trigger

# Дефолты переживают /reload: выставляются только если ещё не заданы.
execute unless score #lock_distance mosseater.safe_config matches 1.. run scoreboard players set #lock_distance mosseater.safe_config 4
execute unless score #raycast_steps mosseater.safe_config matches 1.. run scoreboard players set #raycast_steps mosseater.safe_config 40
scoreboard players set #ready mosseater.safe_config 1

# Игроки получают рецепт заново после перезагрузки пака.
tag @a remove ms_recipes
