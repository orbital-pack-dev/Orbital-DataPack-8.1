# УДАРНАЯ ВОЛНА АРХИ-ЩИТА. Контекст: as <цель>, at @s.
# Урон типа player_attack от владельца щита сам даёт ванильное отбрасывание
# СТРОГО ОТ АТАКУЮЩЕГО и засчитывает убийство игроку (лут падает).
# Ванильные i-frames (10 тиков) автоматически делают из этого пульсацию,
# поэтому отдельный кулдаун не нужен.
damage @s 6 minecraft:player_attack by @a[tag=archi_user,limit=1,sort=nearest]

# Дополнительный импульс вверх — мобов буквально подкидывает и расталкивает.
# Игрокам Motion через NBT не применяется — для них работает только ванильный кнокбек выше.
execute unless entity @s[type=minecraft:player] run data modify entity @s Motion[1] set value 0.42d

particle minecraft:electric_spark ~ ~0.6 ~ 0.3 0.4 0.3 0.05 8 force
playsound minecraft:item.shield.block master @a[distance=..24] ~ ~ ~ 0.8 1.4
