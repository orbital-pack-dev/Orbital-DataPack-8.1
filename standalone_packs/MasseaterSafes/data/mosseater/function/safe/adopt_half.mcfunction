# Контекст: as <маркер сейфа-донора>, at <центр присоединённой половины>.
# Диалог создания пароля НЕ показывается: половина наследует настройки сейфа.
execute if entity @s[tag=ms_safe_unlocked] run return run function mosseater:safe/adopt_half_open

data modify storage mosseater:safe key.pw set from entity @s data.pw
execute unless data storage mosseater:safe key.pw run return run function mosseater:safe/adopt_half_open

# Тот же самый замок, что и на первой половине — открывает только «родной» ключ.
function mosseater:safe/apply_lock

summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_half","ms_safe_fresh"]}
data modify entity @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.8,limit=1] data.pw set from storage mosseater:safe key.pw
tag @e[type=minecraft:marker,tag=ms_safe_fresh,distance=..0.8,limit=1] remove ms_safe_fresh
data remove storage mosseater:safe key

playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 1.2
title @a[distance=..6] actionbar {text:"Сундук присоединён к сейфу — пароль скопирован.",color:"gold"}
