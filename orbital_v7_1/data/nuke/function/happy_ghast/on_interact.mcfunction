# Клик по Гасту / Счастливому Гасту.
advancement revoke @s only nuke:interact_ghast
execute if predicate nuke:is_sneaking if items entity @s weapon.mainhand minecraft:tnt at @s run function nuke:happy_ghast/try_attach
