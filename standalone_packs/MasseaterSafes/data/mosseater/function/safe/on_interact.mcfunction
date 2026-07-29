# Контекст: as/at кликнутая interaction.
# interaction.player доступен как relation target, поэтому контекст игрока
# передаётся тегом ms_safe_user, а не обратным поиском по радиусу.
tag @s add ms_safe_clicked
execute on target run function mosseater:safe/on_interact_player

# Ветвление выполняется от самой interaction: as/at @s сохраняются, поэтому
# все дочерние проверки видят точную позицию кликнутого хитбокса.
execute if entity @a[tag=ms_safe_user,limit=1] run function mosseater:safe/interact_entity

# Очистка состояния. После kill @s команды ниже безопасно являются no-op.
tag @a[tag=ms_safe_user] remove ms_safe_user
data remove entity @s interaction
tag @s remove ms_safe_clicked
