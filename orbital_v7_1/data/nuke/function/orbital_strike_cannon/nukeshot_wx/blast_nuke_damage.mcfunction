execute if score orbital_nerf nuke.settings matches ..0 if entity @a[tag=nuke_attacker,limit=1] run damage @s 120 minecraft:player_attack by @a[tag=nuke_attacker,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 unless entity @a[tag=nuke_attacker,limit=1] run damage @s 120 minecraft:player_attack by @p
execute if score orbital_nerf nuke.settings matches ..0 if entity @a[tag=nuke_attacker,limit=1] run damage @s 255 minecraft:player_attack by @a[tag=nuke_attacker,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 unless entity @a[tag=nuke_attacker,limit=1] run damage @s 255 minecraft:player_attack by @p

execute if score orbital_nerf nuke.settings matches 1.. if entity @a[tag=nuke_attacker,limit=1] run damage @s 40 minecraft:player_attack by @a[tag=nuke_attacker,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. unless entity @a[tag=nuke_attacker,limit=1] run damage @s 40 minecraft:player_attack by @p
execute if score orbital_nerf nuke.settings matches 1.. if entity @a[tag=nuke_attacker,limit=1] run damage @s 80 minecraft:player_attack by @a[tag=nuke_attacker,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. unless entity @a[tag=nuke_attacker,limit=1] run damage @s 80 minecraft:player_attack by @p

