# ЖЁСТКАЯ АВТОПОЛОМКА присоединённого сундука.
# Контекст: at <блок сейфа>, который СЕЙЧАС не single.
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:chest[type=single] run setblock ~ ~ ~ air destroy

# Сейф обязан остаться одиночным и запертым.
function mosseater:safe/normalize_single

playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 1 0.8
particle minecraft:crit ~0.5 ~1 ~0.5 0.4 0.4 0.4 12 0.05
title @a[distance=..6] actionbar {text:"Сейф нельзя соединять с сундуком!",color:"red",bold:true}
