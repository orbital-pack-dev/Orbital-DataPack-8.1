# Детонация Таймер-ТНТ. Контекст: as <block_display>, at @s.
execute if block ~ ~ ~ minecraft:barrier run setblock ~ ~ ~ minecraft:air replace

function nuke:util/resolve_owner

particle minecraft:explosion_emitter ~0.5 ~0.5 ~0.5 0 0 0 0 1
playsound minecraft:entity.generic.explode master @a[distance=..64] ~0.5 ~0.5 ~0.5 2 0.7

execute positioned ~0.5 ~0.5 ~0.5 as @e[distance=..7,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:timer_tnt/hurt

execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~0.5 ~0.5 ~0.5 {fuse:1s,Tags:["nuke_boom"]}

tag @a remove nuke_attacker
kill @e[type=minecraft:text_display,tag=tt_text,distance=..3]
kill @s
