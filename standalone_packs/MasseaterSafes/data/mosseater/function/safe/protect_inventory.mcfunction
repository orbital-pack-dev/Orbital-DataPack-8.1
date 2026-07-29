# Контекст: as/at marker настроенного сейфа.
# Воронка под контейнером ломается с обычным дропом.
execute if block ~ ~-1 ~ minecraft:hopper run setblock ~ ~-1 ~ minecraft:air destroy

# Обе контейнерные вагонетки сверху/снизу уничтожаются; /kill сохраняет их
# стандартный entity/container loot согласно gamerule doEntityDrops.
kill @e[distance=..1.5,type=minecraft:hopper_minecart]
kill @e[distance=..1.5,type=minecraft:chest_minecart]
