# Выполняется as Гаст, at @s
function nuke:util/resolve_owner

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 3
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 3 0.7

execute as @e[distance=..8,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud,tag=!tt_hitbox] run function nuke:happy_ghast/hurt

execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}

kill @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..12]
scoreboard players set @s ghast_tnt 0
tag @a remove nuke_attacker
