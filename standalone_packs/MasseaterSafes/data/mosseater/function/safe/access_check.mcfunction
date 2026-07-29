# Каждый клик начинает проверку с чистого storage, без stale password.
data remove storage mosseater:safe key
execute if entity @e[tag=ms_safe_keep_open,distance=..0.75,limit=1,type=minecraft:marker] run return run function mosseater:safe/access_granted

data modify storage mosseater:safe key.password set from entity @e[tag=ms_safe_configured,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] data.safe.password
execute unless data storage mosseater:safe key.password run return run function mosseater:safe/access_denied
function mosseater:safe/access_check_macro with storage mosseater:safe key
data remove storage mosseater:safe key
