# Цепной взрыв Гаста-Камикадзе. Контекст: as гаст, at гаст.
particle minecraft:explosion_emitter ~ ~1 ~ 4 4 4 0 12
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 5 0.8
playsound minecraft:entity.ghast.scream master @a ~ ~ ~ 4 1.2

function nuke:util/resolve_owner

execute if score @s ghast_tnt matches 1..4 if entity @a[tag=nuke_attacker] as @e[distance=0.1..10,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 40 minecraft:explosion by @a[tag=nuke_attacker,limit=1]
execute if score @s ghast_tnt matches 5..9 if entity @a[tag=nuke_attacker] as @e[distance=0.1..15,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 80 minecraft:explosion by @a[tag=nuke_attacker,limit=1]
execute if score @s ghast_tnt matches 10.. if entity @a[tag=nuke_attacker] as @e[distance=0.1..22,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 150 minecraft:explosion by @a[tag=nuke_attacker,limit=1]

execute if score @s ghast_tnt matches 1..4 unless entity @a[tag=nuke_attacker] as @e[distance=0.1..10,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 40 minecraft:explosion
execute if score @s ghast_tnt matches 5..9 unless entity @a[tag=nuke_attacker] as @e[distance=0.1..15,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 80 minecraft:explosion
execute if score @s ghast_tnt matches 10.. unless entity @a[tag=nuke_attacker] as @e[distance=0.1..22,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 150 minecraft:explosion

tag @a remove nuke_attacker

# Разрушение блоков только при выключенной защите блоков.
execute if score block_protection nuke.settings matches 0 if score @s ghast_tnt matches 5.. run summon minecraft:tnt ~ ~ ~ {fuse:1s}

kill @e[type=block_display,tag=ghast_tnt_display,distance=..8]
kill @s
