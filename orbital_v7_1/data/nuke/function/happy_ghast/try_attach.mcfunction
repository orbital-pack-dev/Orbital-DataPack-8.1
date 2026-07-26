# Контекст: as <happy_ghast>, at @s. Игрок — @a[tag=gt_user].
execute unless entity @a[tag=gt_user,limit=1] run return fail

# Шифт + взаимодействие = ручной подрыв прицепа.
execute if score @s ghast_tnt matches 1.. if entity @a[tag=gt_user,limit=1,predicate=nuke:is_sneaking] run return run function nuke:happy_ghast/detonate

# Иначе — прицепляем ТНТ из руки.
execute if items entity @a[tag=gt_user,limit=1] weapon.mainhand minecraft:tnt run return run function nuke:happy_ghast/attach_tnt
