# Контекст: positioned <угол блока воронки>.
setblock ~ ~ ~ minecraft:air destroy
particle minecraft:smoke ~0.5 ~0.5 ~0.5 0.3 0.3 0.3 0.02 15 normal @a[distance=..32]
playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 0.8 1.2
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Воронки не работают с сейфом",color:"red",bold:true}
