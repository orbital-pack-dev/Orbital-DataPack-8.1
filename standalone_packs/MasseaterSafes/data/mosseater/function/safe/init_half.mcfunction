# Контекст: at <центр второй половины нового сейфа>.
data merge block ~ ~ ~ {Lock:"SAFE_LOCKED"}
execute unless entity @e[tag=ms_safe_box,distance=..0.7,limit=1,type=minecraft:marker] run summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_unconfigured"],data:{safe:{keep_open:0b}}}
