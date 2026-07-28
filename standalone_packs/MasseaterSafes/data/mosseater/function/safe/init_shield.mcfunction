# Контекст: угол блока только что поставленного сундука.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return fail

# Сундук стал половиной УЖЕ существующего сейфа: новый пароль не создаём,
# а подтягиваем пароль и настройки первой половины.
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run return run function mosseater:safe/adopt_from_neighbor

# Этот блок уже под защитой — второй раз не настраиваем.
execute positioned ~0.5 ~ ~0.5 if entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.9] run return 0

# Маркер и interaction настройки строго в центре блока.
summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["ms_safe_box","ms_safe_unconfigured"]}
summon minecraft:interaction ~0.5 ~ ~0.5 {Tags:["ms_safe_shield","ms_safe_setup"],width:1.0f,height:1.0f,response:1b}
dialog show @a[tag=ms_safe_user,limit=1] mosseater:safe_setup
