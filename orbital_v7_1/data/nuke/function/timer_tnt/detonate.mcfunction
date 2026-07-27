# Детонация. Контекст: as <block_display tt_display>, at @s.
tag @p[distance=..48] add nuke_attacker

particle minecraft:explosion_emitter ~0.5 ~1 ~0.5 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.6

execute as @e[distance=..6,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:timer_tnt/hurt

execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~0.5 ~ ~0.5 {fuse:1s,Tags:["nuke_boom"]}

tag @a remove nuke_attacker
kill @e[type=minecraft:text_display,tag=tt_text,distance=..3]
kill @e[type=minecraft:marker,tag=tt_marker,distance=..3]
kill @e[type=minecraft:interaction,tag=tt_hitbox,distance=..3]
kill @s
