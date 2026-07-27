# Контекст: as <Гаст с ТНТ>, at @s.
# Дисплеи тянутся к КООРДИНАТАМ ГАСТА-владельца и следуют за ним.
tp @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..12] ~ ~-0.6 ~

# Удар по Гасту — сброс груза и детонация.
execute if data entity @s {HurtTime:9s} run function nuke:happy_ghast/blow_prepare

particle minecraft:smoke ~ ~-0.4 ~ 0.5 0.3 0.5 2 0.01
