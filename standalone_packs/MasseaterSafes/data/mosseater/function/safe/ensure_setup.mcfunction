# Контекст: as <unconfigured marker>, at <центр блока>.
execute unless entity @e[type=minecraft:interaction,tag=ms_safe_setup,distance=..0.8,limit=1] unless entity @e[type=minecraft:interaction,tag=ms_safe_awaiting_key,distance=..0.8,limit=1] run function mosseater:safe/place_setup
