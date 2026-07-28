# Половина сейфа, у которого нет персонального пароля (открытый или ещё не настроенный).
# Контекст: as <маркер сейфа-донора>, at <центр присоединённой половины>.
execute if entity @s[tag=ms_safe_unlocked] run summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_half","ms_safe_unlocked"]}
execute if entity @s[tag=ms_safe_unlocked] run data remove block ~ ~ ~ components."minecraft:lock"
execute if entity @s[tag=ms_safe_unlocked] run return 0

summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_half","ms_safe_unconfigured"]}
