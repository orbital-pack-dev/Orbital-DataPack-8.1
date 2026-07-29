# Контекст: as/at кликнутый guard interaction.
#
# ROOT CAUSE FIX.
# Сейф закрывали ДВА независимых барьера одновременно:
#   1) interaction с response:1b полностью поглощает ПКМ, поэтому блок сундука
#      никогда не получает взаимодействие и ванильный GUI не открывается;
#   2) компонент minecraft:lock оставался на блоке даже после верного ключа.
# Одним кликом снять два барьера невозможно, поэтому проверка ключа теперь
# снимает ОБА: и хитбокс, и ванильный замок.

# 1. Единое окно доступа 100 тиков для обеих половин сейфа.
scoreboard players set @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] mosseater.safe_data 100

# 2. Снятие ванильного замка со всех блоков сейфа.
#    Запись идёт от маркера с align xyz, а не от interaction с Y-смещением.
execute as @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] at @s align xyz run data remove block ~ ~ ~ components."minecraft:lock"

# 3. UX. Игроку явно сообщается, что нужен второй ПКМ уже по самому блоку.
title @a[tag=ms_safe_user,limit=1] actionbar {text:"Сейф открыт — нажмите ПКМ ещё раз",color:"green",bold:true}
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35
execute at @e[tag=ms_safe_box,distance=..1.5,sort=nearest,limit=1,type=minecraft:marker] align xyz run particle minecraft:wax_off ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.02 7 normal @a[distance=..32]

# 4. Удаление хитбоксов. Выполняется и от каждого маркера сейфа, и от точки
#    самой кликнутой interaction, поэтому позиция игрока больше не влияет.
#    Соседние сейфы восстановят собственный guard в том же тике
#    через ensure_interaction, их vanilla lock при этом не снимается.
execute as @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]
kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]
