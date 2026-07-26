recipe give @s nuke:stabshot
recipe give @s nuke:fireshot
recipe give @s nuke:archishield
recipe give @s nuke:withershot
advancement grant @s only nuke:orbital_complex/root

tag @s add joined_player
tellraw @s ["",{"text":"[Orbital Complex] ","color":"dark_aqua"},{"text":"Кастомные рецепты орбитального комплекса добавлены в книгу крафтов верстака.","color":"aqua"}]
