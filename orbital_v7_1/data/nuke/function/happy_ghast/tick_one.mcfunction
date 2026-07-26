# Контекст: as <Гаст с зарядами>, at @s.
# Визуалы держатся на модельке.
execute as @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..10] run tp @s ~ ~ ~ ~14 ~0
particle minecraft:smoke ~ ~1 ~ 1 1 1 3 0.01

# Максимальная загрузка — подрыв.
execute if score @s ghast_tnt matches 14.. run function nuke:happy_ghast/detonate
