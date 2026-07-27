# ORBITAL MORTAR - MAIN EXPLOSION
# ЕДИНЫЙ ВЗРЫВНОЙ ГЕЙТ — #block_protection nuke.config.
execute unless score #block_protection nuke.config matches 0.. run scoreboard players operation #block_protection nuke.config = block_protection nuke.settings

particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0.1 5 force
particle minecraft:large_smoke ~ ~ ~ 8 4 8 0.1 500 force
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 6.0 1.0
playsound minecraft:entity.dragon_fireball.explode master @a ~ ~ ~ 6.0 0.8

# Источник урона фиксируется тегом, чтобы урон и лут засчитались.
tag @p[distance=..48] add nuke_attacker

# Урон по радиусу наносится ВСЕГДА (главный калибр обязан бить цели).
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 80 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 80 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 80 minecraft:fireworks

execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 40 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 40 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 40 minecraft:fireworks

# Защита ВЫКЛ — в точке прилёта честная воронка из пяти зарядов.
# Защита ВКЛ — ни одного физического взрыва, только урон и частицы выше.
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:0s,Tags:["fs_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~2 ~ ~ {fuse:1s,Tags:["fs_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~-2 ~ ~ {fuse:1s,Tags:["fs_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~ ~ ~2 {fuse:1s,Tags:["fs_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~ ~ ~-2 {fuse:1s,Tags:["fs_boom"]}

tag @a remove nuke_attacker
tag @s remove orbital_main
kill @s
