# Выполняется as block_display, at @s
function nuke:util/resolve_owner

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1
particle minecraft:smoke ~ ~ ~ 1 1 1 30 0.05
playsound minecraft:entity.generic.explode master @a[distance=..48] ~ ~ ~ 2 1

execute as @e[distance=..4,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:light_tnt/hurt

execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}

tag @a remove nuke_attacker
kill @e[type=minecraft:wind_charge,tag=light_tnt,distance=..4]
kill @s
