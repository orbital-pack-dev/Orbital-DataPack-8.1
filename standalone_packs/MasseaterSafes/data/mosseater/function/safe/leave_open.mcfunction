# Режим "Оставить открытым".
#
# БАГ 2. Прежняя версия работала селектором distance=..1.5 и снимала защиту с
# любого сундука в сфере: у соседа исчезали interaction и vanilla lock, а его
# NBT затиралось keep_open. Теперь режим применяется поблочно и только к
# половинам текущего сейфа.
function mosseater:safe/select_pair

execute as @e[tag=ms_safe_pair,type=minecraft:marker] at @s run function mosseater:safe/set_keep_open_marker

# Окно доступа 100 тиков, чтобы владелец сразу открыл сундук без хитбокса.
scoreboard players set @e[tag=ms_safe_pair,type=minecraft:marker] mosseater.safe_data 100
execute as @e[tag=ms_safe_pair,type=minecraft:marker] at @s run function mosseater:safe/disable_guard

playsound minecraft:block.iron_door.open block @a[distance=..12] ~ ~ ~ 0.8 1.25

data modify storage mosseater:safe fx.name set value "wax_off"
data modify storage mosseater:safe fx.count set value "8"
execute as @e[tag=ms_safe_pair,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx

function mosseater:safe/clear_pair
kill @s
