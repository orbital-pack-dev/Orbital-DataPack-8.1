# Контекст: as <setup interaction>, at <interaction>.
data modify storage mosseater:safe key.password set from entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name"
execute unless data storage mosseater:safe key.password run return fail

# БАГ 1. Пароль получают только половины ЭТОГО сундука. Прежний радиус 1.5
# записывал пароль ещё и сундуку на Y+1, из-за чего чужой сейф начинал
# открываться этим же ключом.
function mosseater:safe/select_pair

execute as @e[tag=ms_safe_pair,type=minecraft:marker] at @s run function mosseater:safe/set_password_marker

# Счётчик обнуляется: значение 1.. открыло бы окно доступа, которое немедленно
# сняло бы только что установленный замок.
scoreboard players set @e[tag=ms_safe_pair,type=minecraft:marker] mosseater.safe_data 0
execute as @e[tag=ms_safe_pair,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]

item modify entity @a[tag=ms_safe_user,limit=1] weapon.mainhand mosseater:make_key_active
title @a[tag=ms_safe_user,limit=1] actionbar {text:"Пароль сохранён. Защита активна — открывайте ключом",color:"green"}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 1 1

data modify storage mosseater:safe fx.name set value "happy_villager"
data modify storage mosseater:safe fx.count set value "10"
execute as @e[tag=ms_safe_pair,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx

function mosseater:safe/clear_pair
data remove storage mosseater:safe key
kill @s
