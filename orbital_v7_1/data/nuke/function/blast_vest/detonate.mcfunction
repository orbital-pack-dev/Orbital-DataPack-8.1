# Детонация Подрывного Жилета. @s = носитель.
scoreboard players set @s bv_active 0
scoreboard players set @s bv_timer -1
clear @s minecraft:chainmail_chestplate[minecraft:custom_data~{blast_vest:1}]

particle minecraft:explosion_emitter ~ ~1 ~ 2 2 2 0 5
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4 1

# Носитель — это и есть источник урона, поэтому убийства засчитываются ему.
tag @s add nuke_attacker
execute as @e[distance=0.1..10,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 80 minecraft:explosion by @a[tag=nuke_attacker,limit=1]
damage @s 1000 minecraft:explosion by @s
tag @s remove nuke_attacker

# summon creeper заменён на компонентный tnt и только при выключенной защите блоков.
execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s}
