# Контекст: угол блока только что поставленного сейфа.
function mosseater:safe/break_neighbors
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return fail

# Маркер и interaction настройки строго в центре блока.
summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["ms_safe_box","ms_safe_unconfigured"]}
summon minecraft:interaction ~0.5 ~ ~0.5 {Tags:["ms_safe_shield","ms_safe_setup"],width:1.0f,height:1.0f,response:1b}
dialog show @a[tag=ms_safe_user,limit=1] mosseater:safe_setup
