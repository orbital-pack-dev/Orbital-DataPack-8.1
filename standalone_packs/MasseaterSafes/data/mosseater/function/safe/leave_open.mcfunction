# Контекст: as <interaction настройки>, at <блок сундука>.
# «Оставить открытым» — сейф НИКОГДА не запечатывается автоматически.
tag @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.9,limit=1,sort=nearest] add ms_safe_unlocked
tag @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.9,limit=1,sort=nearest] remove ms_safe_unconfigured

# Снимаем замок, который приходит вместе с предметом «Сундук с Паролем».
data remove block ~ ~ ~ components."minecraft:lock"

# Хитбокс всё равно нужен: открытый сейф не должен ломаться киркой.
function mosseater:safe/ensure_interaction
kill @s
