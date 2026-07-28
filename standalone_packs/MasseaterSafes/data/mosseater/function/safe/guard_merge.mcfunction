# Advancement на установку любого обычного сундука. Обязательно revoke,
# иначе событие сработало бы только один раз за жизнь игрока.
advancement revoke @s only mosseater:chest_placed
execute as @e[type=minecraft:marker,tag=ms_safe_box,distance=..8] at @s if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/sync_double
