# МОДУЛЬ 3 — физический разрыв объединения.
# Контекст: as <маркер-донор>, positioned <центр ломаемой половины>.
#
# Ломается ТОЛЬКО пристроенная половина. Донор находится на расстоянии ровно
# 1 блока, поэтому радиусы 0.7 и 0.8 гарантированно не задевают ни его маркер,
# ни его interaction, ни его NBT. Дубликаты не создаются: сначала снимаются
# сущности ломаемой половины, только потом разрушается блок.
data modify storage mosseater:safe fx.name set value "smoke"
data modify storage mosseater:safe fx.count set value "24"
function mosseater:safe/particle_fx

kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
kill @e[tag=ms_safe_box,distance=..0.7,type=minecraft:marker]
execute align xyz run data merge block ~ ~ ~ {Lock:""}

# destroy выбрасывает и сам сундук, и его содержимое: ничего не пропадает.
execute align xyz run setblock ~ ~ ~ minecraft:air destroy

playsound minecraft:block.chest.locked block @a[distance=..12] ~ ~ ~ 0.9 0.65
playsound minecraft:entity.item.break block @a[distance=..12] ~ ~ ~ 0.8 1.1
