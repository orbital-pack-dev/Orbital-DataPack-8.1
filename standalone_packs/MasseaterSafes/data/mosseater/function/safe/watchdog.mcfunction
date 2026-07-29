# Раз в 5 секунд чинит только marker-backed сейфы; чужие сундуки не сканируются.
scoreboard players set @s mosseater.safe_watch 0
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return 0

# Незавершённой настройке всегда нужен расширенный setup hitbox.
execute if entity @s[tag=ms_safe_unconfigured] run function mosseater:safe/ensure_setup

# Настроенный сейф восстанавливается, если нет законного rearm/density cooldown.
execute if entity @s[tag=ms_safe_configured] unless score @s mosseater.safe_data matches 1.. unless entity @e[tag=ms_safe_guard,distance=..0.8,limit=1,type=minecraft:interaction] run function mosseater:safe/ensure_interaction
