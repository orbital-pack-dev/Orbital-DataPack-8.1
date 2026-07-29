# Контекст: as <unconfigured marker>, at <центр блока>.
execute unless entity @e[tag=ms_safe_setup,distance=..0.8,limit=1,type=minecraft:interaction] unless entity @e[tag=ms_safe_awaiting_key,distance=..0.8,limit=1,type=minecraft:interaction] run function mosseater:safe/place_setup
