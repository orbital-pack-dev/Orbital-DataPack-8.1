# Попытка закрепить ТНТ. Контекст: as игрок, at игрок.
# Игрок помечается тегом, иначе внутри attach_tnt контекст игрока терялся
# и clear/сообщения уходили случайному ближайшему игроку.
tag @s add gt_user
execute as @e[type=#nuke:ghast_types,distance=..6,limit=1,sort=nearest] at @s run function nuke:happy_ghast/attach_tnt
tag @s remove gt_user
