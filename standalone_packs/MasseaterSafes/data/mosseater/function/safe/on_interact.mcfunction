# Контекст: as/at кликнутый interaction.
# execute on target — точный игрок из interaction.player, без nearest-player гонок.
tag @s add ms_safe_clicked
execute on target run function mosseater:safe/on_interact_player

# При отказе interaction остаётся жить: сброс обязателен для следующего ПКМ.
# При успехе сущность уже уничтожена, и data remove становится безопасным no-op.
data remove entity @s interaction
tag @s remove ms_safe_clicked
