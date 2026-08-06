# Старый ms_safe_unlocked становится постоянным NBT-состоянием keep_open.
data modify entity @s data.safe.keep_open set value 1b
data remove entity @s data.safe.password
data remove entity @s data.pw
tag @s remove ms_safe_unlocked
tag @s remove ms_safe_unconfigured
tag @s remove ms_safe_configured
tag @s add ms_safe_keep_open
data merge block ~ ~ ~ {Lock:""}
