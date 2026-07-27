# ORBITAL DATAPACK — ROOT TICK (Minecraft 1.21.11)
scoreboard players remove @a[scores={stab_delay=1..}] stab_delay 1
scoreboard players remove @a[scores={nuke_delay=1..}] nuke_delay 1
scoreboard players remove @a[scores={wither_delay=1..}] wither_delay 1
scoreboard players remove @a[scores={mortar_delay=1..}] mortar_delay 1
scoreboard players remove @a[scores={up_check=1..}] up_check 1
scoreboard players remove @a[scores={up_msg=1..}] up_msg 1

execute as @a[tag=!joined_player] run function nuke:setup_player
execute as @a[tag=!nuke_recipes] run function nuke:give_recipes

# ЗАДАЧА 1: тумблер Орбитального комплекса (#orbital_enabled nuke.config).
# Выключено — снимаем рецепты и ломаем пушки в руках вне креатива.
execute if score #orbital_enabled nuke.config matches 0 run function nuke:orbital_strike_cannon/disabled_tick

execute as @a[scores={use_rod=1..}] if items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{nukeshot:1b}] at @s run function nuke:orbital_strike_cannon/upgrade_nukeshot/trigger
execute as @a[scores={use_rod=1..}] at @s run function nuke:orbital_strike_cannon/rod/handle_use_rod
execute as @a if items entity @s weapon.mainhand minecraft:fishing_rod[custom_data~{stabshot:1b}] at @s run function nuke:orbital_strike_cannon/upgrade/trigger
execute as @a if items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{stabshot:1b}] at @s run function nuke:orbital_strike_cannon/upgrade/trigger

# ЗАДАЧА 1.3: перед тиком каждого выстрела — проверка тумблера.
# Если комплекс выключен и рядом нет игрока в креативе — попытка выстрела
# сбрасывается (abort_shot), и тиковая функция выстрела уже не вызывается.
execute as @e[type=minecraft:block_display,tag=stabshot] at @s run function nuke:orbital_strike_cannon/activate_shots/stab
execute as @e[type=minecraft:block_display,tag=nukeshot] at @s if score #orbital_enabled nuke.config matches 0 unless entity @a[gamemode=creative,distance=..64] run function nuke:orbital_strike_cannon/abort_shot
execute as @e[type=minecraft:block_display,tag=nukeshot] at @s run function nuke:orbital_strike_cannon/activate_shots/nuke
execute as @e[type=minecraft:block_display,tag=withershot] at @s if score #orbital_enabled nuke.config matches 0 unless entity @a[gamemode=creative,distance=..64] run function nuke:orbital_strike_cannon/abort_shot
execute as @e[type=minecraft:block_display,tag=withershot] at @s run function nuke:orbital_strike_cannon/activate_shots/wither
# ФИКС (аудит): удалены мёртвые строки, падавшие каждый тик:
#  - вызов nuke:orbital_strike_cannon/tick — такой функции нет в датапаке;
#  - вызов nuke:orbital_strike_cannon/fire_shot/init_shots/wither — функции нет;
#  - селекторы по объективам orb_strike/stab_strike/wither_strike/mortar_fire,
#    которые нигде не создаются (load.mcfunction) и нигде не сбрасываются.
# Активация выстрелов полностью покрыта строками с block_display выше.
function nuke:orbital_strike_cannon/tick_protection

execute as @e[type=minecraft:firework_rocket,tag=!orbital_main,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert,nbt={FireworksItem:{components:{"minecraft:custom_data":{orbital_rocket:1b}}}}] run tag @s add orbital_main
tag @a remove holding_orb_mortar
execute as @a if items entity @s weapon.mainhand minecraft:crossbow[custom_data~{orbital_mortar_bow:1b}] run tag @s add holding_orb_mortar
execute as @a[tag=holding_orb_mortar] at @s run tag @e[type=minecraft:firework_rocket,distance=..8,tag=!orbital_main,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert] add orbital_main
execute as @e[type=minecraft:firework_rocket,tag=orbital_main,tag=!orb_processed] at @s run function nuke:orbital_strike_cannon/fire_shot/init_rocket
execute as @e[type=minecraft:firework_rocket,tag=orbital_main] at @s run function nuke:orbital_strike_cannon/fire_shot/main_rocket_brain
scoreboard players add @e[type=minecraft:firework_rocket,tag=orbital_child] orb_lifetime 1
execute as @e[type=minecraft:firework_rocket,tag=orbital_child,scores={orb_lifetime=2..}] at @s run function nuke:orbital_strike_cannon/fire_shot/child_damage

# Direct, simple Archi-Shield checks in both hands.
execute as @a if items entity @s weapon.mainhand *[custom_data~{archi_shield:1b}] at @s run function nuke:archi_shield/main
execute as @a unless items entity @s weapon.mainhand *[custom_data~{archi_shield:1b}] if items entity @s weapon.offhand *[custom_data~{archi_shield:1b}] at @s run function nuke:archi_shield/main
execute as @a[scores={archi_delay=1..}] unless items entity @s weapon.mainhand *[custom_data~{archi_shield:1b}] unless items entity @s weapon.offhand *[custom_data~{archi_shield:1b}] run scoreboard players remove @s archi_delay 1

# Direct, simple Blast Vest check.
execute as @a if items entity @s armor.chest *[custom_data~{blast_vest:1b}] at @s run function nuke:blast_vest/main
execute as @a[scores={bv_active=1..}] unless items entity @s armor.chest *[custom_data~{blast_vest:1b}] run function nuke:blast_vest/reset

execute as @a at @s if items entity @s weapon.mainhand minecraft:wind_charge[custom_data~{light_tnt:1b}] run tag @e[type=minecraft:wind_charge,distance=..8,tag=!lt_processed] add light_tnt
execute as @a at @s if items entity @s weapon.offhand minecraft:wind_charge[custom_data~{light_tnt:1b}] run tag @e[type=minecraft:wind_charge,distance=..8,tag=!lt_processed] add light_tnt
execute as @e[type=minecraft:wind_charge,tag=light_tnt,tag=!lt_processed] at @s run function nuke:light_tnt/init
function nuke:light_tnt/tick

function nuke:happy_ghast/tick
execute as @a[nbt={FallFlying:1b}] if items entity @s armor.chest minecraft:elytra[minecraft:enchantments~[{enchantments:"breaching_enchantment:breaching"}]] at @s run function breaching_enchantment:flight_check
execute as @e[type=minecraft:item,tag=!tt_init,nbt={OnGround:1b}] at @s if data entity @s Item.components."minecraft:custom_data".timer_tnt run function nuke:timer_tnt/init
function nuke:timer_tnt/tick
function nuke:safe/process_setup
function nuke:safe/tick
execute as @e[type=minecraft:interaction,tag=safe_shield] at @s unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest run kill @s
function nuke:settings/process_triggers
# ЗАДАЧА 1: обработка тумблера + синхронизация настроек с nuke.config.
function nuke:settings/process_orbital_toggle
execute as @a run function nuke:settings/enable_triggers
scoreboard players reset @a damage_taken
scoreboard players reset @a damage_blocked_by_shield
scoreboard players reset @a shield_used
