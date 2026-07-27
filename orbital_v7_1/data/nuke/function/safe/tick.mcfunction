# СЕЙФЫ — один простой тиковый цикл по маркерам.

# 1) Блок исчез (сломали или взорвали) — выдаём КАСТОМНЫЙ дроп.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless block ~ ~ ~ minecraft:chest run function nuke:safe/drop

# 2) АВТОПОЛОМКА СОСЕДНИХ СУНДУКОВ — 4 стороны, любой порядок установки.
execute at @e[type=minecraft:marker,tag=safe_box] positioned ~1 ~ ~ if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air destroy
execute at @e[type=minecraft:marker,tag=safe_box] positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air destroy
execute at @e[type=minecraft:marker,tag=safe_box] positioned ~ ~ ~1 if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air destroy
execute at @e[type=minecraft:marker,tag=safe_box] positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air destroy

# 3) АВТОЗАКРЫТИЕ: нет игрока в 6 блоках — замок вшивается прямо в блок.
execute as @e[type=minecraft:marker,tag=safe_box] at @s unless entity @a[distance=..6] run data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{nuke_key_active:true}}}

# 4) Сброс временного доступа у отошедших игроков.
execute as @e[type=minecraft:marker,tag=safe_box] at @s run tag @a[distance=6..] remove safe_user
execute as @e[type=minecraft:marker,tag=safe_box] at @s run tag @a[distance=6..] remove safe_awaiting_key
