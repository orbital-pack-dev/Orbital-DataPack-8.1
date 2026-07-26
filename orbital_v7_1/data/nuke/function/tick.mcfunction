# ORBITAL RAILGUN - TICK
# ВАЖНО (Аудит-3): флаги custom_data во ВСЁМ проекте — NBT byte (1b).
# Код orbital_strike_cannon/** исторически проверяет {stabshot:1b} и т.д.,
# поэтому int-флаги из Аудита-2 полностью ломали предикаты предметов.

scoreboard players remove @a[scores={stab_delay=1..}] stab_delay 1
scoreboard players remove @a[scores={nuke_delay=1..}] nuke_delay 1
scoreboard players remove @a[scores={wither_delay=1..}] wither_delay 1
scoreboard players remove @a[scores={mortar_delay=1..}] mortar_delay 1
scoreboard players remove @a[scores={up_check=1..}] up_check 1
scoreboard players remove @a[scores={up_msg=1..}] up_msg 1

execute as @a[tag=!joined_player] run function nuke:setup_player
execute as @a[tag=!nuke_recipes] run function nuke:give_recipes
execute as @a[scores={use_rod=1..}] at @s run function nuke:orbital_strike_cannon/rod/handle_use_rod

execute as @a if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{stabshot:1b}] at @s run function nuke:orbital_strike_cannon/upgrade/trigger
execute as @a if items entity @s weapon.offhand minecraft:fishing_rod[minecraft:custom_data~{nukeshot:1b}] at @s run function nuke:orbital_strike_cannon/upgrade_nukeshot/trigger

execute as @e[type=block_display,tag=stabshot] at @s run function nuke:orbital_strike_cannon/activate_shots/stab
execute as @e[type=block_display,tag=nukeshot] at @s run function nuke:orbital_strike_cannon/activate_shots/nuke
execute as @e[type=block_display,tag=withershot] at @s run function nuke:orbital_strike_cannon/activate_shots/wither

# 5) Орбитальные пушки (Метеор, Нюка, Визер и др.)
execute as @e[type=interaction,tag=orbital_strike_cannon] at @s run function nuke:orbital_strike_cannon/tick
function nuke:orbital_strike_cannon/tick_protection
execute as @a[scores={orb_strike=1..}] at @s run function nuke:orbital_strike_cannon/activate_shots/nuke
execute as @a[scores={stab_strike=1..}] at @s run function nuke:orbital_strike_cannon/activate_shots/stab
execute as @a[scores={wither_strike=1..}] at @s run function nuke:orbital_strike_cannon/activate_shots/wither
execute as @a[scores={mortar_fire=1..}] at @s run function nuke:orbital_strike_cannon/fire_shot/init_shots/wither

# ════════════════════════════════════════════════════════════
# ORBITAL MORTAR — detect & process
# ════════════════════════════════════════════════════════════
execute as @e[type=firework_rocket,tag=!orbital_main,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert,nbt={FireworksItem:{components:{"minecraft:custom_data":{orbital_rocket:1b}}}}] run tag @s add orbital_main

# Резервное определение по близости к стрелявшему игроку.
tag @a remove holding_orb_mortar
execute as @a if items entity @s weapon.mainhand minecraft:crossbow[minecraft:custom_data~{orbital_mortar_bow:1b}] run tag @s add holding_orb_mortar
execute as @a[tag=holding_orb_mortar] at @s run tag @e[type=firework_rocket,distance=..8,tag=!orbital_main,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert] add orbital_main

execute as @e[type=firework_rocket,tag=orbital_main,tag=!orb_processed] at @s run function nuke:orbital_strike_cannon/fire_shot/init_rocket
execute as @e[type=firework_rocket,tag=orbital_main] at @s run function nuke:orbital_strike_cannon/fire_shot/main_rocket_brain

scoreboard players add @e[type=firework_rocket,tag=orbital_child] orb_lifetime 1
execute as @e[type=firework_rocket,tag=orbital_child,scores={orb_lifetime=2..}] at @s run function nuke:orbital_strike_cannon/fire_shot/child_damage

# ════════════════════════════════════════════════════════════
# ARCHI-SHIELD — обработка ровно один раз за тик.
# Кулдаун archi_delay уменьшается внутри archi_shield/main.
# ════════════════════════════════════════════════════════════
execute as @a if items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] at @s run function nuke:archi_shield/main
execute as @a unless items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] if items entity @s weapon.offhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] at @s run function nuke:archi_shield/main
execute as @a[scores={archi_delay=1..}] unless items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] unless items entity @s weapon.offhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] run scoreboard players remove @s archi_delay 1

# ════════════════════════════════════════════════════════════
# CHAOS UPDATE TICKS
# ════════════════════════════════════════════════════════════
# 1) Подрывной Жилет
execute as @a if items entity @s armor.chest minecraft:chainmail_chestplate[minecraft:custom_data~{blast_vest:1b}] at @s run function nuke:blast_vest/main

# 2) Лёгкий ТНТ (wind_charge)
execute as @a at @s if items entity @s weapon.mainhand minecraft:wind_charge[minecraft:custom_data~{light_tnt:1b}] run tag @e[type=wind_charge,distance=..6,tag=!lt_processed] add light_tnt
execute as @a at @s if items entity @s weapon.offhand minecraft:wind_charge[minecraft:custom_data~{light_tnt:1b}] run tag @e[type=wind_charge,distance=..6,tag=!lt_processed] add light_tnt
execute as @e[type=wind_charge,tag=light_tnt,tag=!lt_processed] at @s run function nuke:light_tnt/init
function nuke:light_tnt/tick

# 3) Взрывные Счастливые Гасты
function nuke:happy_ghast/tick

# 4) Зачарование Пробивной на Элитрах
execute as @a[nbt={FallFlying:1b}] if items entity @s armor.chest minecraft:elytra[minecraft:enchantments~[{enchantments:"breaching_enchantment:breaching"}]] at @s run function breaching_enchantment:flight_check

# 5) Таймер-ТНТ: один проход по лежащим на земле предметам вместо четырёх сканов.
execute as @e[type=item,tag=!tt_init,nbt={OnGround:1b}] at @s if data entity @s Item.components."minecraft:custom_data".timer_tnt run function nuke:timer_tnt/init
function nuke:timer_tnt/tick

# 6) Защищённые Сундуки (Safe)
function nuke:safe/process_setup
function nuke:safe/tick_guard
execute as @e[type=interaction,tag=safe_shield] at @s unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run kill @s
function nuke:settings/process_triggers
execute as @a run function nuke:settings/enable_triggers

# Сброс детекторов урона за тик
scoreboard players reset @a damage_taken
scoreboard players reset @a damage_blocked_by_shield
scoreboard players reset @a shield_used

execute as @a if items entity @s weapon.* minecraft:potion[minecraft:custom_data~{potion_of_saturation:1b}] at @s run function nuke:potion_of_saturation/visuals
