# Выполняется as Гаст, at @s
execute unless entity @a[tag=gt_user,limit=1] run return fail
execute if entity @a[tag=gt_user,limit=1,predicate=nuke:is_sneaking] run return run function nuke:happy_ghast/detonate
execute if items entity @a[tag=gt_user,limit=1] weapon.mainhand minecraft:tnt run return run function nuke:happy_ghast/attach_tnt
execute if items entity @a[tag=gt_user,limit=1] weapon.offhand minecraft:tnt run return run function nuke:happy_ghast/attach_tnt
