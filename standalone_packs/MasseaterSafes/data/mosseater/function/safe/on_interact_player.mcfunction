# Контекст: as <игрок из interaction.player>.
# Явно считываем selected_item для текущего клика; access_check сравнивает
# custom_name password-id и active custom_data непосредственно в этой руке.
data modify storage mosseater:safe click.selected_item set from entity @s SelectedItem
tag @s add ms_safe_user
execute as @e[tag=ms_safe_clicked,distance=..4,sort=nearest,limit=1,type=minecraft:interaction] at @s run function mosseater:safe/interact_entity
tag @s remove ms_safe_user
data remove storage mosseater:safe click
