# Контекст: at <центр второй половины нового сейфа>.
data remove block ~ ~ ~ components."minecraft:lock"
execute unless entity @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7,limit=1] run summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_unconfigured"],data:{safe:{keep_open:0b}}}
