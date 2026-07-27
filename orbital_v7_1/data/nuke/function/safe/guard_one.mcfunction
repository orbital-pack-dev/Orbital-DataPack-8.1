# Выполняется as marker[safe_box], at @s (точно в блоке сейфа)

# 1) Сейфа больше нет (сломали/заменили) — маркер не должен висеть вечно.
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run return run kill @s

# 2) ГЛАВНАЯ ЗАЩИТА: сейф всегда type=single.
# Работает в ОБОИХ сценариях: и когда обычный сундук ставят к сейфу,
# и когда СЕЙФ ставят к обычному сундуку — сейф сам расцепляется.
# ФИКС: раньше вызывалась несуществующая функция nuke:safe/split_self_do;
# nuke:safe/normalize_single делает именно это (расцепка с сохранением
# содержимого и восстановлением замка из маркера safe_box).
execute unless block ~ ~ ~ minecraft:chest[type=single] run function nuke:safe/normalize_single

# 3) АВТОЗАКРЫТИЕ ПО ДИСТАНЦИИ: если хотя бы один игрок ближе 6 блоков — ничего не делаем.
execute if entity @a[distance=..6] run return 0

# Все игроки дальше 6 блоков (distance=6..) — запечатываем и сбрасываем временный доступ.
function nuke:safe/seal
