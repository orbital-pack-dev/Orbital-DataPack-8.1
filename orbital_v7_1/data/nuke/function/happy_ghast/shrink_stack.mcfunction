# Контекст: as <предмет Динамита с count > 1>.
# Простое уменьшение стека на 1 через служебный счёт.
execute store result score #tt_pid nuke.settings run data get entity @s Item.count
scoreboard players remove #tt_pid nuke.settings 1
execute store result entity @s Item.count int 1 run scoreboard players get #tt_pid nuke.settings
