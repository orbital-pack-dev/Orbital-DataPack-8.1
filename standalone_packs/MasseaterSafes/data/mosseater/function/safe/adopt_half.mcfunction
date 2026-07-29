# Legacy-совместимость; активная архитектура использует clone_half.
execute if entity @s[tag=ms_safe_unlocked] run return run function mosseater:safe/adopt_half_open
data modify storage mosseater:safe key.pw set from entity @s data.pw
execute unless data storage mosseater:safe key.pw run return run function mosseater:safe/adopt_half_open
function mosseater:safe/apply_lock
summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_half","ms_safe_fresh"]}
data modify entity @e[tag=ms_safe_fresh,distance=..0.8,limit=1,type=minecraft:marker] data.pw set from storage mosseater:safe key.pw
tag @e[tag=ms_safe_fresh,distance=..0.8,limit=1,type=minecraft:marker] remove ms_safe_fresh
data remove storage mosseater:safe key
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 1.2
