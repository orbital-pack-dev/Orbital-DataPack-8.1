# Контекст: as <маркер>, at <блок>. Вызов при distance >= 4.
execute if entity @s[tag=ms_safe_keep_open] run return 0
execute unless entity @s[tag=ms_safe_configured] run return 0

# Только отсутствующий lock инициирует новое запечатывание и 60t rearm.
execute unless data block ~ ~ ~ components."minecraft:lock" run function mosseater:safe/relock
