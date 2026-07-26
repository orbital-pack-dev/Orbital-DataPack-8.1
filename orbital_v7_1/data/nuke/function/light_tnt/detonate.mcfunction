# Взрыв Лёгкого ТНТ. Контекст: as <block_display заряда>, at @s.
function nuke:util/resolve_owner

particle minecraft:explosion ~ ~ ~ 0 0 0 0 1
playsound minecraft:entity.generic.explode block @a[distance=..32] ~ ~ ~ 1 1.2

execute as @e[distance=..3,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:light_tnt/hurt

# Вместо summon creeper {ignited:true} (взрывы криперов на сервере отключены).
execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}

tag @a remove nuke_attacker
kill @e[type=minecraft:wind_charge,tag=light_tnt,distance=..2]
kill @s
