# Контекст: as <маркер>, at <центр блока>.
# Обнуление счётчика ОБЯЗАТЕЛЬНО первым: значение 1.. означает открытое окно
# доступа, в котором access_window снимает замок каждый тик. Прежняя версия
# ставила здесь 60 и тем самым сама себя разблокировала.
scoreboard players set @s mosseater.safe_data 0

# apply_marker_lock собирает item predicate в storage и пишет его одной
# командой через align xyz строго в block entity сундука.
function mosseater:safe/apply_marker_lock

# Снятие возможных устаревших хитбоксов. Актуальный guard с корректными
# размерами и тегами создаст ensure_interaction в этом же тике.
kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]

playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 1.0
execute align xyz run particle minecraft:smoke ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.01 5 normal @a[distance=..32]
