# Контекст: as <Гаст с ТНТ>, at @s.
# Дисплеи ПРИЛИПАЮТ к модельке: тянем их к себе каждый тик.
execute rotated as @s run tp @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..12] ~ ~-0.9 ~ ~ 0

# По Гасту ударили — сброс груза и детонация.
execute if data entity @s {HurtTime:9s} run function nuke:happy_ghast/blow_prepare

particle minecraft:smoke ~ ~-0.5 ~ 0.6 0.3 0.6 2 0.01
