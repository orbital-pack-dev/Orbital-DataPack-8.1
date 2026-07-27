# Выполняется as <Гаст>, at @s (цепочка достижения interact_ghast -> on_interact).
execute unless entity @a[tag=gt_user,limit=1] run return fail

# Shift + взаимодействие = подрыв (строго через системный предикат).
execute if entity @a[tag=gt_user,limit=1,predicate=nuke:is_sneaking] run return run function nuke:happy_ghast/detonate

# ТНТ в руке: списываем один предмет и вешаем один заряд.
execute unless items entity @a[tag=gt_user,limit=1] weapon.mainhand minecraft:tnt unless items entity @a[tag=gt_user,limit=1] weapon.offhand minecraft:tnt run return fail
execute if score @s ghast_tnt matches 14.. run return fail
clear @a[tag=gt_user,limit=1] minecraft:tnt 1
function nuke:happy_ghast/attach_tnt
