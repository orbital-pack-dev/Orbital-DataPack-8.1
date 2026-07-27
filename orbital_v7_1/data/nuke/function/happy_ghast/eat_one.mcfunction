# Контекст: as <предмет ТНТ на земле>, at @s. Один вызов = максимум один заряд.
scoreboard players set #gh_attached nuke.settings 0
execute as @e[type=minecraft:happy_ghast,distance=..6,scores={ghast_tnt=..13},limit=1,sort=nearest] at @s run function nuke:happy_ghast/attach_tnt
execute if score #gh_attached nuke.settings matches 0 as @e[type=minecraft:ghast,distance=..6,scores={ghast_tnt=..13},limit=1,sort=nearest] at @s run function nuke:happy_ghast/attach_tnt
execute if score #gh_attached nuke.settings matches 0 run return fail

# Заряд навешен — списываем ровно один предмет из стека.
execute store result score #ghast_stack nuke.settings run data get entity @s Item.count
execute if score #ghast_stack nuke.settings matches 2.. run return run function nuke:happy_ghast/shrink_stack
kill @s
