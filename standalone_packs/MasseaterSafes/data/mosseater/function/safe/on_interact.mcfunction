# Контекст: as/at кликнутый interaction.
# Relation target указывает на UUID из interaction.player.
tag @s add ms_safe_clicked
execute on target run function mosseater:safe/on_interact_player

# Если проверка отказала и interaction остался жив, обязательно очищаем клик.
# После успешного kill команды ниже безопасно завершаются как no-op.
data remove entity @s interaction
tag @s remove ms_safe_clicked
