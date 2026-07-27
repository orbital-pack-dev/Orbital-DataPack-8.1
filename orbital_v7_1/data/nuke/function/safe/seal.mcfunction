# Context: Safe marker; called only when no player is within four blocks.
tag @a remove safe_user
tag @a remove safe_awaiting_key

# Configured marker has password data; restore the exact password lock.
execute if data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run function nuke:safe/restore_lock_read

# Unconfigured Safe keeps a generic active-key lock.
execute unless data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{nuke_key_active:1b}}}

# Запечатывание также нормализует габариты уже существующего interaction:
# одиночный сундук — 1.2×1.2, большой — 2.2×2.2 (низ сундука перекрыт).
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3] run data merge entity @s {width:1.2f,height:1.2f}
execute unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:interaction,tag=safe_guard,distance=..1.3] run data merge entity @s {width:2.2f,height:2.2f}
