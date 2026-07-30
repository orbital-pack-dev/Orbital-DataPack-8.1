# Контекст: positioned <центр блока сейфа>.
kill @e[type=minecraft:hopper_minecart,distance=..1.2]
kill @e[type=minecraft:chest_minecart,distance=..1.2]
particle minecraft:smoke ~ ~ ~ 0.5 0.5 0.5 0.03 20 normal @a[distance=..32]
playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 0.8 1.0
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Вагонетки не работают с сейфом",color:"red",bold:true}
