# Arm exactly one charge. No primed TNT entity and no recursive function.
execute unless score #tt_scale nuke.settings matches 1.. run scoreboard players set #tt_scale nuke.settings 1200
execute unless score #20 nuke.settings matches 20 run scoreboard players set #20 nuke.settings 20
summon minecraft:block_display ~-0.5 ~-0.5 ~-0.5 {Tags:["tt_display","tt_init","tt_new"],block_state:{Name:"minecraft:tnt"},teleport_duration:0}
# КОЛЛИЗИЯ — МАГМА-КУБ (вместо Слайма).
# ВАЖНО про формат 1.21.11:
#   • поля сущности — snake_case (size / no_ai / silent / invulnerable / no_gravity /
#     persistence_required / health), старые Size/NoAI/Invulnerable игнорируются молча;
#   • идентификаторы атрибутов больше НЕ имеют префикса generic.
#     (minecraft:max_health, minecraft:scale и т.д.). С "minecraft:generic.scale"
#     команда не парсится целиком и куб не спавнится вовсе.
# Значения атрибутов сохранены ровно такими, как в техзадании.
summon minecraft:magma_cube ~ ~0.5 ~ {size:1,no_ai:1b,silent:1b,invulnerable:1b,no_gravity:1b,persistence_required:1b,death_loot_table:"minecraft:empty",health:1024.0f,active_effects:[{id:"minecraft:invisibility",amplifier:0b,duration:-1,show_particles:0b,show_icon:0b,ambient:0b}],attributes:[{id:"minecraft:max_health",base:1024.0},{id:"minecraft:armor",base:30.0},{id:"minecraft:armor_toughness",base:20.0},{id:"minecraft:knockback_resistance",base:1.0},{id:"minecraft:movement_speed",base:0.0},{id:"minecraft:attack_damage",base:0.0},{id:"minecraft:scale",base:1.96}],Tags:["display_solid_wall","timer_tnt_slime"]}
summon minecraft:interaction ~ ~-0.5 ~ {Tags:["tt_hitbox","tt_init","tt_new"],width:1.0f,height:1.0f,response:1b}
summon minecraft:marker ~ ~ ~ {Tags:["tt_marker","tt_init","tt_new"]}
# Marker is at block centre (Y+0.5), so +0.7 produces block Y+1.2.
summon minecraft:text_display ~ ~0.7 ~ {Tags:["tt_text","tt_init","tt_new"],billboard:"center",see_through:1b,shadow:1b,view_range:32f,text:{text:"ТАЙМЕР-ТНТ",color:"red",bold:true}}
scoreboard players operation @e[tag=tt_new,distance=..2] tt_hours = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..2] tt_timer = #tt_hours nuke.settings
scoreboard players operation @e[tag=tt_new,distance=..2] tt_timer *= #tt_scale nuke.settings
execute as @e[type=minecraft:marker,tag=tt_marker,tag=tt_new,distance=..2,limit=1,sort=nearest] at @s run function nuke:timer_tnt/second
tag @e[tag=tt_new,distance=..2] remove tt_new
playsound minecraft:block.note_block.bell block @a[distance=..24] ~ ~ ~ 1 0.8
