# keep_open снимает только замок, но защитный hitbox остаётся против ломания.
# Правильный клик временно убирает hitbox без требования ключа.
execute if entity @e[type=minecraft:marker,tag=ms_safe_keep_open,distance=..0.75,limit=1] run return run function mosseater:safe/access_granted

# Настроенный сейф: загружаем password-id ближайшей половины и проверяем ключ.
data modify storage mosseater:safe key.password set from entity @e[type=minecraft:marker,tag=ms_safe_configured,distance=..0.75,sort=nearest,limit=1] data.safe.password
execute unless data storage mosseater:safe key.password run return run function mosseater:safe/access_denied
function mosseater:safe/access_check_macro with storage mosseater:safe key
data remove storage mosseater:safe key
