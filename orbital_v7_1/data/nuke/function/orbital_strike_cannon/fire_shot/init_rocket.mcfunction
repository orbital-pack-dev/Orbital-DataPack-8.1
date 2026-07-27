# ORBITAL MORTAR - INIT ROCKET
tag @s add orb_processed
scoreboard players set @s orb_ticks 0

# Prevent vanilla from exploding the rocket early — override LifeTime.
# ЗАДАЧА 3.2: Silent:1b — гасим ванильный шум ракеты каждый тик;
# звук полёта теперь играется вручную раз в 20 тиков (main_rocket_brain).
data merge entity @s {LifeTime:1200,Life:0,ShotAtAngle:1b,Silent:1b}

# Tag the nearest player as owner
execute as @p[distance=..10,sort=nearest,limit=1] run tag @s add orb_owner

# ЗАДАЧА 1.3: тумблер Орбитального комплекса для Fire-Shot.
# Выключено и стрелок не в креативе — ракета гаснет, попытка сбрасывается (return 0).
execute if score #orbital_enabled nuke.config matches 0 unless entity @p[tag=orb_owner,gamemode=creative,distance=..12] run title @p[tag=orb_owner] actionbar {"text":"⛔ Орбитальный комплекс отключён","color":"red"}
execute if score #orbital_enabled nuke.config matches 0 unless entity @p[tag=orb_owner,gamemode=creative,distance=..12] run kill @s
execute unless entity @s run return 0

# Check cooldown
execute if score personal_cd nuke.settings matches 1.. as @p[tag=orb_owner,scores={mortar_delay=1..}] run title @s actionbar {"text":"MORTAR: перезарядка","color":"gold"}
execute if score personal_cd nuke.settings matches 1.. if entity @p[tag=orb_owner,scores={mortar_delay=1..}] run kill @s
execute if score personal_cd nuke.settings matches 1.. unless entity @s run return 0

# Check XP requirement and spend XP
execute as @p[tag=orb_owner] run scoreboard players operation @s nuke.xp_cost = nuke.cfg.xp_mortar nuke.settings
execute as @p[tag=orb_owner] run function nuke:check_xp
execute if entity @p[tag=orb_owner,scores={nuke.action_ok=0}] run kill @s
execute unless entity @s run return 0

# Apply cooldown
execute if score personal_cd nuke.settings matches 1.. run scoreboard players operation @p[tag=orb_owner] mortar_delay = nuke.cfg.mortar_cd nuke.settings

# ЗАДАЧА 3.1 — ФИКСАЦИЯ ТРАЕКТОРИИ.
# Вектор взгляда стрелка запоминается ОДИН РАЗ в момент выстрела:
# Rotation ракеты = Rotation игрока, дальше main_rocket_brain только пересчитывает
# Motion по этому фиксированному направлению — никакого дрейфа и хоуминга.
data modify entity @s Rotation set from entity @p[tag=orb_owner,limit=1] Rotation
execute at @s positioned 0.0 0.0 0.0 rotated as @s run summon minecraft:marker ^ ^ ^0.35 {Tags:["orb_vector_init"]}
data modify entity @s Motion set from entity @e[type=minecraft:marker,tag=orb_vector_init,limit=1] Pos
kill @e[type=minecraft:marker,tag=orb_vector_init]

# Звук старта — ровно один раз.
execute at @s run playsound minecraft:entity.firework_rocket.launch ambient @a[distance=..48] ~ ~ ~ 1.5 0.7
