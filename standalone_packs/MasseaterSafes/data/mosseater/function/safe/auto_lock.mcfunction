# Контекст: as <маркер>, at <блок>. Вызов при distance >= 4.
execute if entity @s[tag=ms_safe_keep_open] run return 0
execute unless entity @s[tag=ms_safe_configured] run return 0

# Активное окно ключа закрывается немедленно при отходе, без ещё одной задержки.
execute if entity @s[tag=ms_safe_access_open] run return run function mosseater:safe/close_access_now

# Остальные legacy-состояния используют штатный rearm.
execute unless data block ~ ~ ~ components."minecraft:lock" run function mosseater:safe/relock
