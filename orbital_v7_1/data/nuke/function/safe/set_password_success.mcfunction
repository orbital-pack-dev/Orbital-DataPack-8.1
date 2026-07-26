data modify entity @s data.password set from entity @p SelectedItem.components."minecraft:custom_name"
item modify entity @p weapon.mainhand nuke:make_key_active
function nuke:safe/lock_chest_macro with entity @s data
tag @s remove safe_awaiting_key
tag @s add safe_locked
title @p actionbar {"text":"Пароль установлен! Сундук надёжно заперт.","color":"green"}
playsound minecraft:block.chest.locked master @p ~ ~ ~ 1 1
