# Контекст: as <маркер interaction сейфа>, at <блок сундука>.
# Открытие уже запертого сундука обеспечивает ваниль через компонент
# minecraft:lock, поэтому кастомная ветка try_open больше не нужна.
execute if entity @s[tag=safe_awaiting_key] run function nuke:safe/set_password
