# Контекст: as/at кликнутый guard interaction.
#
# Сейф закрывают ДВА независимых барьера: interaction с response:1b поглощает
# ПКМ, а компонент minecraft:lock держит блок. Верный ключ снимает оба, но
# ТОЛЬКО у половин текущего сейфа.

# 0. БАГ 1 + БАГ 2. Точный набор маркеров: собственный блок и, если он есть,
#    строго горизонтальный партнёр по ванильному type=left|right.
execute unless entity @e[tag=ms_safe_pair,type=minecraft:marker] run function mosseater:safe/select_pair

# 1. МОДУЛЬ 2. Длительность окна зависит от плотности застройки.
scoreboard players set #window mosseater.safe_config 60
execute if entity @e[tag=ms_safe_pair,scores={ms_safe_neighbors=4..},limit=1,type=minecraft:marker] run scoreboard players set #window mosseater.safe_config 1200

# 2. Единое окно доступа для обеих половин сейфа.
scoreboard players operation @e[tag=ms_safe_pair,type=minecraft:marker] mosseater.safe_data = #window mosseater.safe_config
tag @e[tag=ms_safe_pair,type=minecraft:marker] add ms_safe_auth

# 3. Снятие хитбокса и ванильного замка поблочно, без работы по радиусу.
execute as @e[tag=ms_safe_pair,type=minecraft:marker] at @s run function mosseater:safe/disable_guard

# 4. UX.
execute if score #window mosseater.safe_config matches 60 run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Сейф открыт на 3 сек — нажмите ПКМ ещё раз",color:"green",bold:true}
execute if score #window mosseater.safe_config matches 1200 run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Складской режим: сейф открыт на 60 сек",color:"aqua",bold:true}
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35

# 5. МОДУЛЬ 1. Партиклы в геометрическом центре крышки.
data modify storage mosseater:safe fx.name set value "wax_off"
data modify storage mosseater:safe fx.count set value "7"
execute as @e[tag=ms_safe_pair,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx

function mosseater:safe/clear_pair
