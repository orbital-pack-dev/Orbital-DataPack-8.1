# Контекст: at <центр блока, на который поставлен предмет-сейф>.
kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
kill @e[tag=ms_safe_box,distance=..0.7,type=minecraft:marker]
data merge block ~ ~ ~ {Lock:"SAFE_LOCKED"}
summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_unconfigured"],data:{safe:{keep_open:0b}}}
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/init_partner
function mosseater:safe/place_setup
dialog show @a[tag=ms_safe_user,limit=1] mosseater:safe_setup
playsound minecraft:block.anvil.use block @a[distance=..12] ~ ~ ~ 0.55 1.35
execute align xyz run particle minecraft:enchant ~0.5 ~0.5 ~0.5 0.35 0.35 0.35 0.03 12 normal @a[distance=..32]
