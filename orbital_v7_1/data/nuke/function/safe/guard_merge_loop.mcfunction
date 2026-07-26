# Рейкаст от глаз игрока до первого сундука (максимум 30 шагов по 0.25 блока).
execute if block ~ ~ ~ minecraft:chest run return run function nuke:safe/guard_merge_check
scoreboard players remove @s raycast_limit 1
execute if score @s raycast_limit matches 1.. positioned ^ ^ ^0.25 run function nuke:safe/guard_merge_loop
