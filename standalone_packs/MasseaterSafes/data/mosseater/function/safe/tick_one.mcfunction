# Контекст: as <маркер сейфа>, at <блок сундука>.
execute unless block ~ ~ ~ minecraft:chest run return run function mosseater:safe/drop

# Сейф склеили в большой сундук — вторая половина ПЕРЕНИМАЕТ пароль сейфа.
execute unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/adopt_merge

# Игрок ближе 4 блоков — прячем хитбокс, чтобы UI сундука был кликабелен.
execute if entity @a[distance=..4] run kill @e[type=minecraft:interaction,tag=ms_safe_guard,distance=..1.6]

# Игрок отошёл дальше 4 блоков — замок возвращается, interaction восстанавливается.
execute unless entity @a[distance=..4] run function mosseater:safe/auto_lock
