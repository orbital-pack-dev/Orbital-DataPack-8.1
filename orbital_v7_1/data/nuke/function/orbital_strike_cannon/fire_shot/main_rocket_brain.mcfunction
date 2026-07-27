# ORBITAL MORTAR - MAIN ROCKET BRAIN
scoreboard players add @s orb_ticks 1

# Keep rocket alive while flying — reset Life counter every tick
data modify entity @s Life set value 0

# ЗАДАЧА 3.1 — ТРАЕКТОРИЯ.
# Убран блок хоуминга (marker orb_tracker + tp @s facing entity), который каждый тик
# разворачивал ракету на ближайшую цель и сбивал прицел игрока.
# Направление зафиксировано в init_rocket (Rotation стрелка) и больше не меняется:
# здесь по этому вектору просто пересчитывается Motion (0.35 блока/тик = 7 m/s).
execute at @s positioned 0.0 0.0 0.0 rotated as @s run summon minecraft:marker ^ ^ ^0.35 {Tags:["orb_vector"]}
data modify entity @s Motion set from entity @e[type=minecraft:marker,tag=orb_vector,limit=1] Pos
kill @e[type=minecraft:marker,tag=orb_vector]

# ЗАДАЧА 3.2 — ЗВУК ПОЛЁТА БЕЗ СПАМА.
# playsound не каждый тик, а раз в 20 тиков (modulo от orb_ticks по константе #20).
scoreboard players operation @s nuke.temp = @s orb_ticks
scoreboard players operation @s nuke.temp %= #20 nuke.settings
execute if score @s nuke.temp matches 0 at @s run playsound minecraft:entity.firework_rocket.launch ambient @a[distance=..48] ~ ~ ~ 1.2 0.7
execute if score @s nuke.temp matches 0 at @s run particle minecraft:large_smoke ~ ~ ~ 0.1 0.1 0.1 0.01 3 force

# TIMELINE PHASES
execute if score @s orb_ticks matches 40 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 80 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 120 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 160 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 180 run function nuke:orbital_strike_cannon/fire_shot/spawn_horizontal_ring
execute if score @s orb_ticks matches 220 run function nuke:orbital_strike_cannon/fire_shot/spawn_vertical_ring
execute if score @s orb_ticks matches 260.. run function nuke:orbital_strike_cannon/fire_shot/main_explosion

# DETONATION TRIGGERS (Contact with enemy or block collision after leaving crossbow)
execute if score @s orb_ticks matches 6.. if entity @e[distance=0.1..3.0,type=#nuke:valid_targets,tag=!orb_owner,tag=!orbital_child,tag=!orbital_main] run function nuke:orbital_strike_cannon/fire_shot/main_explosion
execute if score @s orb_ticks matches 6.. unless block ^ ^ ^0.6 #minecraft:air unless block ^ ^ ^0.6 #minecraft:replaceable run function nuke:orbital_strike_cannon/fire_shot/main_explosion
