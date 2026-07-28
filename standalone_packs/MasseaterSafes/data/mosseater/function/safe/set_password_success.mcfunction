# Контекст: as <setup interaction>, at <interaction>. Все маркеры этой конструкции
# находятся не дальше 0.75 (single=0.2 по Y, double=0.5 по горизонтали).
data modify storage mosseater:safe key.password set from entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name"
execute unless data storage mosseater:safe key.password run return fail

execute as @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75] at @s run function mosseater:safe/set_password_marker
item modify entity @a[tag=ms_safe_user,limit=1] weapon.mainhand mosseater:make_key_active

title @a[tag=ms_safe_user,limit=1] actionbar {text:"Пароль сохранён. Ключ привязан к сейфу.",color:"green"}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 1 1
particle minecraft:happy_villager ~ ~0.8 ~ 0.4 0.3 0.4 10 0.03

data remove storage mosseater:safe key
kill @s
