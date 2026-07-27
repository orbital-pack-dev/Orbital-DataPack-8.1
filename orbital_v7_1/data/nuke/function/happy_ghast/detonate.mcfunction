# Выполняется as Гаст, at @s
function nuke:util/resolve_owner
# ЕДИНЫЙ ВЗРЫВНОЙ ГЕЙТ — #block_protection nuke.config.
execute unless score #block_protection nuke.config matches 0.. run scoreboard players operation #block_protection nuke.config = block_protection nuke.settings

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 3
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 3 0.7

execute as @e[distance=..8,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud,tag=!tt_hitbox] run function nuke:happy_ghast/hurt

# Защита ВЫКЛ — мощность взрыва равна количеству навешанных зарядов (ghast_tnt).
execute if score #block_protection nuke.config matches 0 run scoreboard players operation #gh_left nuke.settings = @s ghast_tnt
execute if score #block_protection nuke.config matches 0 if score #gh_left nuke.settings matches 1.. run function nuke:happy_ghast/blow_loop

kill @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..12]
scoreboard players set @s ghast_tnt 0
tag @a remove nuke_attacker
