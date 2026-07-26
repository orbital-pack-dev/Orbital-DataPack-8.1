# Контекст: as <маркер interaction сейфа>, at <блок сундука>.
# Атомарный перевод одного и того же маркера из состояния "настройка"
# в состояние "ожидание ключа".
tag @s remove safe_setup
tag @s add safe_awaiting_key
