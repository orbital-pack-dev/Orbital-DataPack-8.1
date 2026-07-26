# Детонация Таймер-ТНТ
particle explosion_emitter ~ ~0.5 ~ 3 3 3 0 8
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4 1
execute as @e[distance=0.1..12,type=!#nuke:technical,type=!item] run damage @s 70 minecraft:explosion by @p[limit=1]

# Настоящий взрыв (разрушает блоки, если block_protection выключен)
execute if score block_protection nuke.settings matches 0 run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:8b,ignited:true}
execute if score block_protection nuke.settings matches 1 run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:0b,ignited:true}

kill @e[type=text_display,tag=tt_text,distance=..3,limit=1]
kill @s
