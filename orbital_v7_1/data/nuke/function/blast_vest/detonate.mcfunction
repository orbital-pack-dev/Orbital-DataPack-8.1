# Выполняется as игрок-носитель, at @s
scoreboard players set @s bv_active 0
scoreboard players reset @s bv_timer

# Владелец взрыва — сам носитель, убийства засчитываются ему.
tag @a remove nuke_attacker
tag @s add nuke_attacker

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 2
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 3 0.7

execute as @e[distance=..7,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud,tag=!tt_hitbox] run function nuke:blast_vest/hurt

execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}

item replace entity @s armor.chest with minecraft:air
tag @s remove bv_owner
tag @a remove nuke_attacker
