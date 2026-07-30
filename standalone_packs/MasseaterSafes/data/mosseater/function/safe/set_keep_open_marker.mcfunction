# Контекст: as <маркер>, at <маркер>. Вызывается только по набору ms_safe_pair.
data modify entity @s data.safe.keep_open set value 1b
data remove entity @s data.safe.password
tag @s remove ms_safe_unconfigured
tag @s remove ms_safe_configured
tag @s add ms_safe_keep_open

# align xyz гарантирует запись в block entity собственного блока даже если
# маркер стоит не ровно в центре.
execute align xyz run data remove block ~ ~ ~ components."minecraft:lock"
