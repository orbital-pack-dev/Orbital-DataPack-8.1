# Миграция e7a0ecb и более ранних маркеров: data.pw -> data.safe.password.
data modify entity @s data.safe.password set from entity @s data.pw
data modify entity @s data.safe.keep_open set value 0b
data remove entity @s data.pw
tag @s remove ms_safe_unconfigured
tag @s remove ms_safe_unlocked
tag @s add ms_safe_configured
function mosseater:safe/apply_marker_lock
