# Контекст: as/at marker после завершения 60-тактового окна.
execute unless entity @s[tag=ms_safe_keep_open] run function mosseater:safe/apply_marker_lock
tag @s remove ms_safe_access_open
