# Загружаем password-id ближайшей половины и проверяем ключ макросом.
data modify storage mosseater:safe key.password set from entity @e[type=minecraft:marker,tag=ms_safe_configured,distance=..0.75,sort=nearest,limit=1] data.safe.password
execute unless data storage mosseater:safe key.password run return run function mosseater:safe/access_denied
function mosseater:safe/access_check_macro with storage mosseater:safe key
data remove storage mosseater:safe key
