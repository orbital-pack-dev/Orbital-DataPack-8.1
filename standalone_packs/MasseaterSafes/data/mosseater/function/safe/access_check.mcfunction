# Контекст: as/at кликнутый guard interaction.
# Радиус поиска маркеров 1.5 покрывает и single, и общий hitbox double chest.
execute if entity @e[tag=ms_safe_keep_open,distance=..1.5,limit=1,type=minecraft:marker] run return run function mosseater:safe/access_granted

data modify storage mosseater:safe key.password set from entity @e[tag=ms_safe_configured,distance=..1.5,sort=nearest,limit=1,type=minecraft:marker] data.safe.password
execute unless data storage mosseater:safe key.password run return run function mosseater:safe/access_denied
function mosseater:safe/access_check_macro with storage mosseater:safe key
data remove storage mosseater:safe key
