# Контекст: as <игрок>, positioned <текущая точка луча>.
# Каждый шаг уменьшает счётчик: функция не может уйти в бесконечную рекурсию.
scoreboard players remove @s raycast_limit 1

# Нашли сундук, который ещё не занят интеракцией настройки -> запускаем настройку
# и немедленно выходим (return), чтобы не продолжать луч сквозь блок.
execute if block ~ ~ ~ #minecraft:all_signs run return fail
execute if block ~ ~ ~ minecraft:chest unless entity @e[type=interaction,tag=safe_shield,distance=..1.5,limit=1] run return run function nuke:safe/found
execute if block ~ ~ ~ minecraft:trapped_chest unless entity @e[type=interaction,tag=safe_shield,distance=..1.5,limit=1] run return run function nuke:safe/found

# Луч упёрся в сундук, который уже защищён -> выходим.
execute if block ~ ~ ~ minecraft:chest run return fail
execute if block ~ ~ ~ minecraft:trapped_chest run return fail

# Следующий шаг: только если остались итерации и мы не ушли дальше 6 блоков.
execute if score @s raycast_limit matches 1.. positioned ^ ^ ^0.25 if entity @s[distance=..6] run function nuke:safe/raycast_loop
