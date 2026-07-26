# ORBITAL RAILGUN - TICK

scoreboard players remove @a[scores={stab_delay=1..}] stab_delay 1
scoreboard players remove @a[scores={nuke_delay=1..}] nuke_delay 1
scoreboard players remove @a[scores={wither_delay=1..}] wither_delay 1
scoreboard players remove @a[scores={mortar_delay=1..}] mortar_delay 1
scoreboard players remove @a[scores={archi_delay=1..}] archi_delay 1
scoreboard players remove @a[scores={up_check=1..}] up_check 1
scoreboard players remove @a[scores={up_msg=1..}] up_msg 1

execute as @a[tag=!joined_player] run function nuke:setup_player
execute as @a[scores={use_rod=1..}] at @s run function nuke:orbital_strike_cannon/rod/handle_use_rod

execute as @a if items entity @s weapon.offhand fishing_rod[custom_data~{stabshot:1}] at @s run function nuke:orbital_strike_cannon/upgrade/trigger
execute as @a if items entity @s weapon.offhand fishing_rod[custom_data~{nukeshot:1}] at @s run function nuke:orbital_strike_cannon/upgrade_nukeshot/trigger

execute as @e[type=block_display,tag=stabshot] at @s run function nuke:orbital_strike_cannon/activate_shots/stab
execute as @e[type=block_display,tag=nukeshot] at @s run function nuke:orbital_strike_cannon/activate_shots/nuke
execute as @e[type=block_display,tag=withershot] at @s run function nuke:orbital_strike_cannon/activate_shots/wither

# 5) Орбитальные пушки (Метеор, Нюка, Визер и др.)
execute as @e[type=interaction,tag=orbital_strike_cannon] at @s run function nuke:orbital_strike_cannon/tick
execute if score block_protection nuke.settings matches 1 run function nuke:orbital_strike_cannon/tick_protection
execute as @a[scores={orb_strike=1..}] at @s run function nuke:orbital_strike_cannon/activate_shots/nuke
execute as @a[scores={stab_strike=1..}] at @s run function nuke:orbital_strike_cannon/activate_shots/stab
execute as @a[scores={wither_strike=1..}] at @s run function nuke:orbital_strike_cannon/activate_shots/wither
execute as @a[scores={mortar_fire=1..}] at @s run function nuke:orbital_strike_cannon/fire_shot/init_shots/wither

# ═══════════════════════════════════════════════════════════
# ORBITAL MORTAR — detect & process
# ═══════════════════════════════════════════════════════════

# Method 1: Direct NBT check on entity — FireworksItem stores the item components
execute as @e[type=firework_rocket,tag=!orbital_main,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert,nbt={FireworksItem:{components:{"minecraft:custom_data":{orbital_rocket:1}}}}] run tag @s add orbital_main
execute as @e[type=firework_rocket,tag=!orbital_main,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert,nbt={FireworksItem:{components:{"minecraft:custom_data":{orbital_rocket:1}}}}] run tag @s add orbital_main

# Method 2: Proximity fallback — if a player just shot from the Orbital Mortar crossbow
tag @a remove holding_orb_mortar
execute as @a if items entity @s weapon.mainhand crossbow[custom_data~{orbital_mortar_bow:1}] run tag @s add holding_orb_mortar
execute as @a if items entity @s weapon.mainhand crossbow[custom_data~{orbital_mortar_bow:1}] run tag @s add holding_orb_mortar
execute as @a[tag=holding_orb_mortar] at @s run tag @e[type=firework_rocket,distance=..8,tag=!orbital_main,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert] add orbital_main

# Initialize newly detected rockets
execute as @e[type=firework_rocket,tag=orbital_main,tag=!orb_processed] at @s run function nuke:orbital_strike_cannon/fire_shot/init_rocket

# Run brain logic for active rockets
execute as @e[type=firework_rocket,tag=orbital_main] at @s run function nuke:orbital_strike_cannon/fire_shot/main_rocket_brain

# Child rockets lifetime counter & contact detonation
scoreboard players add @e[type=firework_rocket,tag=orbital_child] orb_lifetime 1
execute as @e[type=firework_rocket,tag=orbital_child,scores={orb_lifetime=2..}] at @s run function nuke:orbital_strike_cannon/fire_shot/child_damage

# ═══════════════════════════════════════════════════════════
# ARCHI-SHIELD (Архи-Щит) — mechanics & detection (1.21.11)
# ═══════════════════════════════════════════════════════════
execute as @a if items entity @s weapon.mainhand shield[custom_data~{archi_shield:1}] at @s run function nuke:archi_shield/main
execute as @a if items entity @s weapon.mainhand shield[custom_data~{archi_shield:1}] at @s run function nuke:archi_shield/main
execute as @a if items entity @s weapon.offhand shield[custom_data~{archi_shield:1}] at @s run function nuke:archi_shield/main
execute as @a if items entity @s weapon.offhand shield[custom_data~{archi_shield:1}] at @s run function nuke:archi_shield/main



# ═══════════════════════════════════════════════════════════
# CHAOS UPDATE v8.0 TICKS
# ═══════════════════════════════════════════════════════════
# 1) Подрывной Жилет
execute as @a if items entity @s armor.chest chainmail_chestplate[custom_data~{blast_vest:1}] at @s run function nuke:blast_vest/main

# 2) Лёгкий ТНТ (wind_charge)
execute as @e[type=wind_charge,tag=!lt_processed,nbt={Item:{components:{"minecraft:custom_data":{light_tnt:1}}}}] at @s run function nuke:light_tnt/init
execute as @a at @s if items entity @s weapon.mainhand wind_charge[custom_data~{light_tnt:1}] run tag @e[type=wind_charge,distance=..6,tag=!lt_processed] add light_tnt
execute as @e[type=wind_charge,tag=light_tnt,tag=!lt_processed] at @s run function nuke:light_tnt/init
function nuke:light_tnt/tick

# 3) Взрывные Счастливые Гасты (happy_ghast & ghast)
function nuke:happy_ghast/tick

# 4) Зачарование Пробивной 1 на Элитрах
execute as @a[nbt={FallFlying:true}] if items entity @s armor.chest elytra[enchantments~[{enchantments:"breaching_enchantment:breaching"}]] at @s run function breaching_enchantment:flight_check

# 5) Таймер-ТНТ (item)
execute as @e[type=item,tag=!tt_init,nbt={OnGround:1b,Item:{components:{"minecraft:custom_data":{timer_tnt:1}}}}] at @s run function nuke:timer_tnt/init
execute as @e[type=item,tag=!tt_init,nbt={OnGround:1b,Item:{components:{"minecraft:custom_data":{timer_tnt:2}}}}] at @s run function nuke:timer_tnt/init
execute as @e[type=item,tag=!tt_init,nbt={OnGround:1b,Item:{components:{"minecraft:custom_data":{timer_tnt:3}}}}] at @s run function nuke:timer_tnt/init
execute as @e[type=item,tag=!tt_init,nbt={OnGround:1b,Item:{components:{"minecraft:custom_data":{timer_tnt:4}}}}] at @s run function nuke:timer_tnt/init
function nuke:timer_tnt/tick

# 6) Защищённые Сундуки (Safe)
function nuke:safe/process_setup
execute as @e[type=interaction,tag=safe_locked] at @s run function nuke:safe/tick
execute as @e[type=interaction,tag=safe_shield] at @s unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run kill @s
function nuke:settings/process_triggers
execute as @a run function nuke:settings/enable_triggers

# Reset per-tick detection scoreboards
scoreboard players reset @a damage_taken
scoreboard players reset @a damage_blocked_by_shield
scoreboard players reset @a shield_used

execute as @a if items entity @s weapon.* potion[custom_data~{potion_of_saturation:1}] at @s run function nuke:potion_of_saturation/visuals
