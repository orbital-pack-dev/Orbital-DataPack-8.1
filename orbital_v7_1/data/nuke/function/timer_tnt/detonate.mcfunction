# Детонация Таймер-ТНТ. @s = block_display, позиция = угол блока.
# Взрыв криперов убран полностью: сервер их отключает, и лут не засчитывался.
setblock ~ ~ ~ minecraft:air replace
particle minecraft:explosion_emitter ~0.5 ~0.5 ~0.5 2 2 2 0 6
playsound minecraft:entity.generic.explode master @a ~0.5 ~0.5 ~0.5 4 1

function nuke:util/resolve_owner
execute positioned ~0.5 ~0.5 ~0.5 if entity @a[tag=nuke_attacker] as @e[distance=0.1..12,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 70 minecraft:explosion by @a[tag=nuke_attacker,limit=1]
execute positioned ~0.5 ~0.5 ~0.5 unless entity @a[tag=nuke_attacker] as @e[distance=0.1..12,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 70 minecraft:explosion
tag @a remove nuke_attacker

# Разрушение блоков только если защита блоков выключена.
execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~0.5 ~0.5 ~0.5 {fuse:1s}

kill @e[type=text_display,tag=tt_text,distance=..2,limit=1,sort=nearest]
kill @s
