# Контекст: as <маркер-донор>, positioned <центр новой половины>.
# Вызывается только из check_partner, когда усыновление половины разрешено.
data modify storage mosseater:safe transfer.safe set from entity @s data.safe
summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_fresh"]}
data modify entity @e[tag=ms_safe_fresh,distance=..0.7,limit=1,type=minecraft:marker] data.safe set from storage mosseater:safe transfer.safe
execute if entity @s[tag=ms_safe_configured] run tag @e[tag=ms_safe_fresh,distance=..0.7,limit=1,type=minecraft:marker] add ms_safe_configured
execute if entity @s[tag=ms_safe_keep_open] run tag @e[tag=ms_safe_fresh,distance=..0.7,limit=1,type=minecraft:marker] add ms_safe_keep_open
execute if entity @s[tag=ms_safe_unconfigured] run tag @e[tag=ms_safe_fresh,distance=..0.7,limit=1,type=minecraft:marker] add ms_safe_unconfigured
tag @e[tag=ms_safe_fresh,distance=..0.7,limit=1,type=minecraft:marker] remove ms_safe_fresh
execute if entity @s[tag=ms_safe_configured] run function mosseater:safe/apply_marker_lock
execute if entity @s[tag=ms_safe_keep_open] align xyz run data merge block ~ ~ ~ {Lock:""}
data remove storage mosseater:safe transfer
playsound minecraft:block.chest.locked block @a[distance=..12] ~ ~ ~ 0.65 1.2

# МОДУЛЬ 1. Подтверждение усыновления половины показывается в центре крышки.
data modify storage mosseater:safe fx.name set value "happy_villager"
data modify storage mosseater:safe fx.count set value "10"
function mosseater:safe/particle_fx
