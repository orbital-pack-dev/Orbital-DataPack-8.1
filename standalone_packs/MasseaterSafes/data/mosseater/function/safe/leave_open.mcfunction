# Контекст: interaction настройки у сейфа.
tag @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.9,limit=1,sort=nearest] add ms_safe_unlocked
tag @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.9,limit=1,sort=nearest] remove ms_safe_unconfigured

execute unless data block ~ ~ ~ components."minecraft:lock" run data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
kill @s
