# После создания пароля временный setup state снимается до удаления shield.
tag @e[tag=ms_safe_setting_up,distance=..1.2,type=minecraft:interaction] remove ms_safe_setting_up
execute if block ~ ~ ~ minecraft:chest[type=single] as @e[tag=ms_safe_setup,distance=..1.2,type=minecraft:interaction] run data merge entity @s {width:1.1f,height:1.4f}
execute if block ~ ~ ~ minecraft:trapped_chest as @e[tag=ms_safe_setup,distance=..1.2,type=minecraft:interaction] run data merge entity @s {width:1.1f,height:1.4f}
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] as @e[tag=ms_safe_setup,distance=..1.2,type=minecraft:interaction] run data merge entity @s {width:2.1f,height:1.4f}
