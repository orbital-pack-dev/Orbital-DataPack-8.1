# Вызов из достижения взаимодействия с Гастом. Контекст: as <игрок>.
# Тег обязателен: из контекста Гаста @p — это ближайший к ГАСТУ игрок,
# а не тот, кто нажал. Именно из-за этого ТНТ снимался у чужого игрока.
tag @s add gt_user
execute at @s as @e[type=minecraft:happy_ghast,distance=..6,limit=1,sort=nearest] at @s run function nuke:happy_ghast/try_attach
tag @s remove gt_user
