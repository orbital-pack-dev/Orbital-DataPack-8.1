# Детонация Лёгкого ТНТ. @s = lt_display.
# summon creeper удалён: криперы на сервере отключены, лут не засчитывался.
function nuke:util/resolve_owner
execute if entity @a[tag=nuke_attacker] as @e[distance=..5,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 20 minecraft:explosion by @a[tag=nuke_attacker,limit=1]
execute unless entity @a[tag=nuke_attacker] as @e[distance=..5,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 20 minecraft:explosion
tag @a remove nuke_attacker

execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s}
execute if score block_protection nuke.settings matches 1 run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 1
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 1
kill @s
