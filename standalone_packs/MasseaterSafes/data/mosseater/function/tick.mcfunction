# MASSEATER SAFES — единый автономный тик (Minecraft 1.21.11)
execute as @a[tag=!ms_recipes] run function mosseater:setup_player
execute as @a[tag=ms_safe_place_pending] at @s run function mosseater:safe/placed_fallback
function mosseater:safe/process_setup
function mosseater:safe/tick

# Spyglass: дешёвые tag/distance/limit фильтры идут перед type.
execute as @e[tag=ms_safe_shield,type=minecraft:interaction] at @s unless entity @e[tag=ms_safe_box,distance=..0.8,limit=1,type=minecraft:marker] run kill @s
execute as @a run function mosseater:enable_triggers
