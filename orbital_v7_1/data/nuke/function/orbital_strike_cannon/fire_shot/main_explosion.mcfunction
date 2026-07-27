# ORBITAL MORTAR - MAIN EXPLOSION
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0.1 5 force
particle minecraft:large_smoke ~ ~ ~ 8 4 8 0.1 500 force
# particle minecraft:flash ~ ~ ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 6.0 1.0
playsound minecraft:entity.dragon_fireball.explode master @a ~ ~ ~ 6.0 0.8

# ЗАДАЧА 3.3: источник урона фиксируется тегом, чтобы урон и лут засчитались.
tag @p[distance=..48] add nuke_attacker

execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 80 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 80 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 80 minecraft:fireworks

execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 40 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 40 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 40 minecraft:fireworks

# ЗАДАЧА 3.3 — ФИНАЛЬНАЯ ДЕТОНАЦИЯ С РАЗРУШЕНИЕМ БЛОКОВ.
# В точке прилёта подрывается реальный взрыв (воронка из 5 зарядов),
# но ТОЛЬКО если защита блоков выключена. Тег fs_boom также подхватывается
# tick_protection: при включённой защите взрыв станет безопасным для блоков.
execute unless score block_protection nuke.settings matches 1 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["fs_boom"]}
execute unless score block_protection nuke.settings matches 1 run summon minecraft:tnt ~2 ~ ~ {fuse:2s,Tags:["fs_boom"]}
execute unless score block_protection nuke.settings matches 1 run summon minecraft:tnt ~-2 ~ ~ {fuse:2s,Tags:["fs_boom"]}
execute unless score block_protection nuke.settings matches 1 run summon minecraft:tnt ~ ~ ~2 {fuse:2s,Tags:["fs_boom"]}
execute unless score block_protection nuke.settings matches 1 run summon minecraft:tnt ~ ~ ~-2 {fuse:2s,Tags:["fs_boom"]}

tag @a remove nuke_attacker
tag @s remove orbital_main
kill @s
