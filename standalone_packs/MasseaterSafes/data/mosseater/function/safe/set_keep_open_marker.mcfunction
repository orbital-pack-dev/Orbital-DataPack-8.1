data modify entity @s data.safe.keep_open set value 1b
data remove entity @s data.safe.password
tag @s remove ms_safe_unconfigured
tag @s remove ms_safe_configured
tag @s add ms_safe_keep_open
data remove block ~ ~ ~ components."minecraft:lock"
