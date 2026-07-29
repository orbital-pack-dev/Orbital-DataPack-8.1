# MASSEATER SAFES — STANDALONE LOAD (Minecraft 1.21.11)
# Автономный пак не использует ни одного скорборда из nuke.*

gamerule sendCommandFeedback false

scoreboard objectives add mosseater.safe_config dummy
scoreboard objectives add mosseater.safe_data dummy
scoreboard objectives add mosseater.safe_auth dummy
scoreboard objectives add mosseater.safe_scan dummy
scoreboard objectives add mosseater.safe_watch dummy
scoreboard objectives add mosseater.safe_density dummy

scoreboard objectives add mosseater.safe_key trigger
scoreboard objectives add mosseater.safe_cancel trigger

execute unless score #lock_distance mosseater.safe_config matches 1.. run scoreboard players set #lock_distance mosseater.safe_config 4
execute unless score #raycast_steps mosseater.safe_config matches 1.. run scoreboard players set #raycast_steps mosseater.safe_config 40
scoreboard players set #ready mosseater.safe_config 1

# Одноразовый hard reset после /reload: удаляет старые leaked interaction около
# marker-backed сейфов. Тиковый менеджер затем создаст ровно одну сущность.
execute as @e[tag=ms_safe_box,type=minecraft:marker] at @s run function mosseater:safe/cleanup_existing

tag @a remove ms_recipes
