# МОДУЛЬ 3 — маршрутизация второй половины double chest.
# Контекст: as <маркер-донор>, positioned <центр пристроенной половины>.
#
# Три исхода:
#   1) У половины уже есть свой маркер  -> разбор конфликта паролей.
#   2) Донор ещё не настроен            -> объединение запрещено, ломаем половину.
#   3) Донор настроен, половина свободна -> безопасное усыновление clone_half.
execute if entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run return run function mosseater:safe/check_partner_conflict
execute if entity @s[tag=ms_safe_unconfigured] run return run function mosseater:safe/break_unconfigured_partner
function mosseater:safe/clone_half
