# Final detonation. This function is called once when tt_timer reaches zero.
# ЕДИНЫЙ ВЗРЫВНОЙ ГЕЙТ — #block_protection nuke.config.
execute unless score #block_protection nuke.config matches 0..1 run scoreboard players operation #block_protection nuke.config = block_protection nuke.settings

tag @p[distance=..48] add nuke_attacker
kill @e[type=minecraft:block_display,tag=tt_display,distance=..1.6]
kill @e[type=minecraft:text_display,tag=tt_text,distance=..1.6]
kill @e[type=minecraft:interaction,tag=tt_hitbox,distance=..1.6]
# Магма-куб сначала уходит в void и только потом умирает — без мелких кубов.
function nuke:timer_tnt/kill_wall
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.6

# Защита ВЫКЛ — гарантированный физический взрыв с разрушением блоков.
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:0s,Tags:["tt_boom"]}

# Защита ВКЛ — только урон по сущностям и частицы, блоки целы.
execute if score #block_protection nuke.config matches 1 as @e[distance=..6,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:timer_tnt/hurt
tag @a remove nuke_attacker
kill @s
