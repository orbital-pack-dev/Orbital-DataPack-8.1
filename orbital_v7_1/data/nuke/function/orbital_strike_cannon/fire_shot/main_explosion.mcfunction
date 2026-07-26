# ORBITAL MORTAR - MAIN EXPLOSION
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0.1 5 force
particle minecraft:large_smoke ~ ~ ~ 8 4 8 0.1 500 force
# particle minecraft:flash ~ ~ ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 6.0 1.0
playsound minecraft:entity.dragon_fireball.explode master @a ~ ~ ~ 6.0 0.8

execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 80 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 80 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 80 minecraft:fireworks

execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 40 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 40 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 40 minecraft:fireworks

tag @s remove orbital_main
kill @s
