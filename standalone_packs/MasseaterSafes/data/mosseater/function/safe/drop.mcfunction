# Маркер пережил блок максимум до этого тика.
#
# МОДУЛЬ 4. Детонация выполняется ДО очистки сущностей, пока состояние мины
# ещё доступно. Условия детонации: заряд был внутри, окно доступа закрыто и
# авторизации ms_safe_auth нет. Сейф в режиме keep_open никогда не минируется.
execute if entity @s[tag=ms_safe_trapped] unless entity @s[tag=ms_safe_auth] unless entity @s[tag=ms_safe_keep_open] unless score @s mosseater.safe_data matches 1.. run function mosseater:safe/trap_detonate

# БАГ 4. Вся работа с дропом вынесена в on_broken, где она привязана строго к
# собственному блоку.
function mosseater:safe/on_broken
