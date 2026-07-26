# Детонация Лёгкого ТНТ при падении
execute as @e[distance=..5,type=!#nuke:technical,type=!item] run damage @s 20 minecraft:explosion by @p[limit=1]
execute if score block_protection nuke.settings matches 0 run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:2b,ignited:true}
execute if score block_protection nuke.settings matches 1 run particle explosion_emitter ~ ~ ~ 1 1 1 0 1
execute if score block_protection nuke.settings matches 1 run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 1
kill @s
