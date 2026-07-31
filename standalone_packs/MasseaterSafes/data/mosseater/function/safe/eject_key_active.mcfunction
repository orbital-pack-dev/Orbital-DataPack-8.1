# АНТИ-ЛОКАУТ — активный ключ выбрасывается из сейфа.
# Контекст: positioned <угол блока сейфа> (align xyz).
#
# Это лучшее решение, чем один лишь мастер-ключ: мастер-ключ лечит
# последствие и требует админа онлайн, а выброс убирает саму возможность
# запереть ключ внутри собственного сейфа.
#
# Путь Items[{components:{...}}] выбирает ПЕРВЫЙ подходящий элемент списка,
# поэтому стопки разбираются по одной за проход, без циклов и макросов.
data modify storage mosseater:safe eject set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{mosseater_key_active:1b}}}]

# Поле Slot существует только в контейнере: в ItemStack сущности-предмета его нет,
# и лишнее поле сломало бы запись.
data remove storage mosseater:safe eject.Slot

summon minecraft:item ~0.5 ~1.1 ~0.5 {Tags:["ms_key_eject"],PickupDelay:10s,Item:{id:"minecraft:stone",count:1}}
data modify entity @e[tag=ms_key_eject,distance=..3,sort=nearest,limit=1,type=minecraft:item] Item set from storage mosseater:safe eject
tag @e[tag=ms_key_eject,distance=..3,type=minecraft:item] remove ms_key_eject

data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{mosseater_key_active:1b}}}]
data remove storage mosseater:safe eject

particle minecraft:enchant ~0.5 ~1.1 ~0.5 0.3 0.3 0.3 0.5 20 normal @a[distance=..24]
playsound minecraft:entity.item.pickup block @a[distance=..12] ~0.5 ~1 ~0.5 0.7 0.6
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Ключ нельзя хранить внутри сейфа",color:"yellow",bold:true}
