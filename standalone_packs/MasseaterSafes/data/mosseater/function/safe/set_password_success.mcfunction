# Контекст: as <setup interaction>, at <interaction>.
data modify storage mosseater:safe key.password set from entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name"
execute unless data storage mosseater:safe key.password run return fail

# Обе половины double chest получают один password-id и 60-тактовое окно.
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run function mosseater:safe/set_password_marker
scoreboard players set @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] mosseater.safe_data 60
execute as @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..0.75,type=minecraft:interaction]

item modify entity @a[tag=ms_safe_user,limit=1] weapon.mainhand mosseater:make_key_active
title @a[tag=ms_safe_user,limit=1] actionbar {text:"Пароль сохранён. Защита включится через 3 секунды.",color:"green"}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 1 1
execute at @e[tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] align xyz run particle minecraft:happy_villager ~0.5 ~0.8 ~0.5 0.4 0.3 0.4 0.03 10 normal @a[distance=..32]

data remove storage mosseater:safe key
kill @s
