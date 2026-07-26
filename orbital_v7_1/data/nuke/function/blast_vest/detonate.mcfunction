# Детонация Подрывного Жилета
scoreboard players set @s bv_active 0
scoreboard players set @s bv_timer -1
clear @s chainmail_chestplate[custom_data~{blast_vest:1}]

particle explosion_emitter ~ ~1 ~ 2 2 2 0 5
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4 1
playsound minecraft:entity.creeper.primed master @a ~ ~ ~ 4 0.5

# Гарантированное убийство носителя и других сущностей от имени игрока
execute as @e[distance=0.1..10,type=!#nuke:technical,type=!item] run damage @s 80 minecraft:explosion by @p[limit=1]
damage @s 1000 minecraft:explosion by @s

# Настоящий взрыв (разрушает блоки, если block_protection выключен)
execute if score block_protection nuke.settings matches 0 run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:6b,ignited:true}
execute if score block_protection nuke.settings matches 1 run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:0b,ignited:true}
