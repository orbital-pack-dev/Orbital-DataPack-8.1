# Контекст: as <предмет Динамита>.
# Просто: если в стеке 1 штука — убираем предмет, иначе уменьшаем стек на 1.
execute store result score #tt_pid nuke.settings run data get entity @s Item.count
execute if score #tt_pid nuke.settings matches ..1 run kill @s
execute if score #tt_pid nuke.settings matches 2.. run function nuke:happy_ghast/shrink_stack
