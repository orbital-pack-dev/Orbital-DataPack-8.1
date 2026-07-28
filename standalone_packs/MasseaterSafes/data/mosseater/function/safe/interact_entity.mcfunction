# Контекст: as <interaction сейфа>, at <блок сундука>.
# Открытие уже запертого сундука обеспечивает ваниль через minecraft:lock.
execute if entity @s[tag=ms_safe_awaiting_key] run function mosseater:safe/set_password
