# Контекст position: центр блока второй половины; executor: исходный marker.
tag @e[tag=ms_safe_box,distance=..0.7,type=minecraft:marker] add ms_safe_exploding
setblock ~ ~ ~ minecraft:air
kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
kill @e[tag=ms_safe_box,distance=..0.7,type=minecraft:marker]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:tnt ~ ~ ~ {fuse:0,explosion_power:4.0f}
