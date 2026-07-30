# Контекст: as/at кликнутый guard interaction.
#
# Сейф закрывают ДВА независимых барьера одновременно:
#   1) interaction с response:1b полностью поглощает ПКМ, поэтому блок сундука
#      никогда не получает взаимодействие и ванильный GUI не открывается;
#   2) компонент minecraft:lock остаётся на блоке даже после верного ключа.
# Одним кликом снять два барьера невозможно, поэтому проверка ключа снимает
# ОБА: и хитбокс, и ванильный замок.

# 1. МОДУЛЬ 2. Длительность окна зависит от плотности застройки.
#    Меньше 4 соседей — обычный режим 60 тиков.
#    4 и более соседей — складской режим 1200 тиков: на складах игрок открывает
#    сундуки подряд, и постоянный цикл lock/unlock даёт лишнюю нагрузку.
scoreboard players set #window mosseater.safe_config 60
execute if entity @e[tag=ms_safe_box,distance=..1.5,scores={ms_safe_neighbors=4..},limit=1,type=minecraft:marker] run scoreboard players set #window mosseater.safe_config 1200

# 2. Единое окно доступа для обеих половин сейфа.
scoreboard players operation @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] mosseater.safe_data = #window mosseater.safe_config
tag @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] add ms_safe_auth

# 3. Снятие ванильного замка со всех блоков сейфа.
#    Запись идёт от маркера с align xyz, а не от interaction с Y-смещением.
execute as @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] at @s align xyz run data remove block ~ ~ ~ components."minecraft:lock"

# 4. UX. Игроку явно сообщается, что нужен второй ПКМ уже по самому блоку,
#    и на сколько времени сейф остаётся открытым.
execute if score #window mosseater.safe_config matches 60 run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Сейф открыт на 3 сек — нажмите ПКМ ещё раз",color:"green",bold:true}
execute if score #window mosseater.safe_config matches 1200 run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Складской режим: сейф открыт на 60 сек",color:"aqua",bold:true}
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35

# 5. МОДУЛЬ 1. Партиклы ровно в геометрическом центре крышки.
data modify storage mosseater:safe fx.name set value "wax_off"
data modify storage mosseater:safe fx.count set value "7"
execute as @e[tag=ms_safe_box,distance=..1.5,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx

# 6. Удаление хитбоксов. Выполняется и от каждого маркера сейфа, и от точки
#    самой кликнутой interaction, поэтому позиция игрока больше не влияет.
#    Соседние сейфы восстановят собственный guard в том же тике
#    через ensure_interaction, их vanilla lock при этом не снимается.
execute as @e[tag=ms_safe_box,distance=..1.5,type=minecraft:marker] at @s run kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]
kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]
