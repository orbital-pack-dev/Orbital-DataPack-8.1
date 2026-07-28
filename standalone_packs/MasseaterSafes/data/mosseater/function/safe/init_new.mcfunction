# Контекст: at <центр блока, на который поставлен предмет-сейф>.
kill @e[type=minecraft:interaction,tag=ms_safe_shield,distance=..0.8]
kill @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.7]
data remove block ~ ~ ~ components."minecraft:lock"
summon minecraft:marker ~ ~ ~ {Tags:["ms_safe_box","ms_safe_unconfigured"],data:{safe:{keep_open:0b}}}

# Для двойного сундука создаём состояние на второй половине, не ломая блоки.
execute if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run function mosseater:safe/init_partner

function mosseater:safe/place_setup
dialog show @a[tag=ms_safe_user,limit=1] mosseater:safe_setup
playsound minecraft:block.anvil.use block @a[distance=..12] ~ ~ ~ 0.55 1.35
particle minecraft:enchant ~ ~0.8 ~ 0.35 0.35 0.35 12 0.03
