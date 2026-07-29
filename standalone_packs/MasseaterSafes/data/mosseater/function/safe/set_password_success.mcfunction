# Контекст: as <setup interaction>, at <interaction>. Все маркеры конструкции
# находятся не дальше 0.75 (single=0.2 по Y, double=0.5 по горизонтали).
data modify storage mosseater:safe key.password set from entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name"
execute unless data storage mosseater:safe key.password run return fail

# Одинаковый password-id записывается в NBT каждого marker и minecraft:lock
# каждой физической половины сундука.
execute as @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75] at @s run function mosseater:safe/set_password_marker
item modify entity @a[tag=ms_safe_user,limit=1] weapon.mainhand mosseater:make_key_active

title @a[tag=ms_safe_user,limit=1] actionbar {text:"Пароль сохранён. Ключ привязан к сейфу.",color:"green"}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 1 1
execute at @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1] align xyz run particle minecraft:happy_villager ~0.5 ~0.5 ~0.5 0.4 0.3 0.4 0.03 10 normal @a[distance=..32]

data remove storage mosseater:safe key
kill @s
