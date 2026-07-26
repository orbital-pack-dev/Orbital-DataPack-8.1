# Тиковая охрана сейфов (вызывается из nuke:tick).
# Каждый запертый сейф представлен одним marker'ом с тегом safe_box,
# в котором хранится пароль (data.pw) — это и есть состояние сейфа.
execute as @e[type=minecraft:marker,tag=safe_box] at @s run function nuke:safe/guard_one

# Сейфы в режиме настройки (пароль ещё не задан) — тоже держим одиночными.
execute as @e[type=minecraft:interaction,tag=safe_shield] at @s run function nuke:safe/split_setup
