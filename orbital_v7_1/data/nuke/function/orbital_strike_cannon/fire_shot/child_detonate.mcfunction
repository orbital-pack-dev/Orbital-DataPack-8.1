# ORBITAL MORTAR - CHILD DETONATION ON IMPACT
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 25 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 25 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 25 minecraft:fireworks

execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 12 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 12 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 12 minecraft:fireworks

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1
playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 2.0 1.0
tag @s remove orbital_child
kill @s
