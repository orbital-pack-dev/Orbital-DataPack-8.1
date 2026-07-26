# Контекст: as <предмет Динамита>.
# Уменьшаем стек на 1; если был последний — предмет исчезает.
execute if data entity @s Item{count:1} run kill @s
execute unless data entity @s Item{count:1} store result entity @s Item.count int 1 run scoreboard players get @s ghast_tnt
execute unless entity @s[nbt={Item:{count:1}}] run function nuke:happy_ghast/shrink_stack
