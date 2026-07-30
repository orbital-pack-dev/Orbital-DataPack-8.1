# Контекст: as <маркер>, at <центр блока>.
# Обнуление счётчика ОБЯЗАТЕЛЬНО первым: значение 1.. означает открытое окно
# доступа, в котором access_window снимает замок каждый тик.
scoreboard players set @s mosseater.safe_data 0

# apply_marker_lock собирает item predicate в storage и пишет его одной
# командой через align xyz строго в block entity сундука.
function mosseater:safe/apply_marker_lock

# БАГ 2. Радиус 0.8, а не 1.5: собственный guard максимум в 0.54, guard соседа
# минимум в 1.0. Прежний радиус убивал защиту независимого сундука рядом,
# и тот на один тик оставался полностью открытым.
kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]

playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 1.0
execute align xyz run particle minecraft:smoke ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.01 5 normal @a[distance=..32]
