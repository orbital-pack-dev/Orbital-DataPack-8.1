# Контекст: positioned <угол коробки ~-1 ~-2 ~-1 от блока сейфа>.
# Коробка dx/dy/dz, а не сфера: вагонетка ПОД сейфом в сферу радиусом 1.2
# не попадала и продолжала выкачивать ресурсы.
kill @e[type=minecraft:hopper_minecart,dx=2,dy=3,dz=2]
kill @e[type=minecraft:chest_minecart,dx=2,dy=3,dz=2]
particle minecraft:smoke ~1.5 ~2.5 ~1.5 0.5 0.5 0.5 0.03 20 normal @a[distance=..32]
playsound minecraft:entity.item.break block @a[distance=..16] ~1.5 ~2.5 ~1.5 0.8 1.0
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Вагонетки не работают с сейфом",color:"red",bold:true}
