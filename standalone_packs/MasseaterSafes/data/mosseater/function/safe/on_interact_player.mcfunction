# Контекст: as игрок, записанный в interaction.player.
tag @s add ms_safe_user
execute as @e[tag=ms_safe_clicked,distance=..4,sort=nearest,limit=1,type=minecraft:interaction] at @s run function mosseater:safe/interact_entity
tag @s remove ms_safe_user
