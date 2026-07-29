# Контекст: as/at marker. Радиус 1.8 покрывает компактный куб 3x3x3.
scoreboard players set @s mosseater.safe_scan 0
scoreboard players set @s mosseater.safe_density 0
tag @e[tag=ms_safe_scan_target,type=minecraft:marker] remove ms_safe_scan_target
tag @s add ms_safe_scan_target
execute as @e[tag=ms_safe_box,distance=..1.8,type=minecraft:marker] run scoreboard players add @e[tag=ms_safe_scan_target,limit=1,type=minecraft:marker] mosseater.safe_density 1
execute if score @s mosseater.safe_density matches 7.. run function mosseater:safe/density_disable
tag @s remove ms_safe_scan_target
