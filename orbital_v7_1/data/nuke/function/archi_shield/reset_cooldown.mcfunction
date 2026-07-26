# Сброс ванильного кулдауна щита: предмет переставляется сам в себя.
# Дубли под byte-вариант удалены — custom_data унифицирован к int 1.
execute if items entity @s weapon.offhand minecraft:shield[minecraft:custom_data~{archi_shield:1}] run item replace entity @s weapon.offhand from entity @s weapon.offhand
execute if items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1}] run item replace entity @s weapon.mainhand from entity @s weapon.mainhand
