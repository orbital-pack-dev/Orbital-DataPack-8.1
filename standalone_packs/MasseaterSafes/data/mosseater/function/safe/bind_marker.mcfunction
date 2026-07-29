# Legacy-совместимость; селекторы приведены к Spyglass ordering.
kill @e[tag=ms_safe_box,distance=..0.8,type=minecraft:marker]
summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_fresh"]}
data modify entity @e[tag=ms_safe_fresh,distance=..0.8,limit=1,type=minecraft:marker] data.pw set from storage mosseater:safe key.pw
tag @e[tag=ms_safe_fresh,distance=..0.8,limit=1,type=minecraft:marker] remove ms_safe_fresh
