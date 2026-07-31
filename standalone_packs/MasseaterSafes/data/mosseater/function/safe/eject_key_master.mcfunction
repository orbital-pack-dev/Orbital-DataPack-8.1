# АНТИ-ЛОКАУТ — мастер-ключ тоже никогда не остаётся в сейфе.
# Контекст: positioned <угол блока сейфа> (align xyz).
#
# Потеря мастер-ключа внутри сейфа была бы хуже любого локаута игрока,
# поэтому правило распространяется и на админа.
data modify storage mosseater:safe eject set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{mosseater_master:1b}}}]
data remove storage mosseater:safe eject.Slot

summon minecraft:item ~0.5 ~1.1 ~0.5 {Tags:["ms_key_eject"],PickupDelay:10s,Item:{id:"minecraft:stone",count:1}}
data modify entity @e[tag=ms_key_eject,distance=..3,sort=nearest,limit=1,type=minecraft:item] Item set from storage mosseater:safe eject
tag @e[tag=ms_key_eject,distance=..3,type=minecraft:item] remove ms_key_eject

data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{mosseater_master:1b}}}]
data remove storage mosseater:safe eject

particle minecraft:witch ~0.5 ~1.1 ~0.5 0.3 0.3 0.3 0.05 20 normal @a[distance=..24]
playsound minecraft:entity.item.pickup block @a[distance=..12] ~0.5 ~1 ~0.5 0.7 0.4
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Мастер-ключ нельзя хранить внутри сейфа",color:"light_purple",bold:true}
