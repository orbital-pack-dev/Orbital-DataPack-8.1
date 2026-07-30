# БАГ 4 — безопасный дроп при разрушении.
# Контекст: as <маркер разрушенного сейфа>, at <маркер>.
#
# Корневая причина: прежний код выполнял
#   kill @e[distance=..1.2,nbt={Item:{id:"minecraft:chest"}},limit=1,sort=nearest]
# Условие nbt={Item:{id:"minecraft:chest"}} — ЧАСТИЧНОЕ совпадение, поэтому под
# него подходил и уже созданный именной "Сундук с Паролем" соседнего сейфа.
# При разрушении двух сундуков в один тик первый сейф успевал заспавнить свой
# предмет, а второй убивал именно его как ближайший в радиусе 1.2. В итоге на
# земле оставался один предмет вместо двух.
#
# Исправление состоит из трёх частей:
#   1) радиус уменьшен до 0.6 — это половина расстояния между блоками, поэтому
#      чужой дроп физически недостижим;
#   2) добавлен фильтр tag=!ms_safe_drop — именные сундуки системы неприкосновенны;
#   3) удаление и спавн выполняются от центра СВОЕГО блока через align xyz,
#      а не от позиции маркера.

kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]

# 1. Удаляется только ванильный дроп собственного блока.
execute align xyz positioned ~0.5 ~0.5 ~0.5 run kill @e[type=minecraft:item,tag=!ms_safe_drop,nbt={Item:{id:"minecraft:chest"}},distance=..0.6,limit=1,sort=nearest]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run kill @e[type=minecraft:item,tag=!ms_safe_drop,nbt={Item:{id:"minecraft:trapped_chest"}},distance=..0.6,limit=1,sort=nearest]

# 2. Свой именной дроп. Тег ms_safe_drop делает его невидимым для очистки
#    любого другого сейфа. Два одинаковых предмета рядом ванильно сложатся в
#    стак на 2 штуки — это штатное поведение, потери предметов нет.
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:item ~ ~ ~ {Tags:["ms_safe_drop"],PickupDelay:10s,Item:{id:"minecraft:chest",count:1,components:{"minecraft:custom_data":{mosseater_safe:1b},"minecraft:item_name":{text:"Сундук с Паролем",color:"gold",italic:false},"minecraft:lore":[{text:"Поставьте, чтобы настроить пароль",color:"gray",italic:false},{text:"Пароль = имя Ключа из наковальни",color:"gray",italic:false},{text:"Совет: добавляйте буквы, а не только цифры",color:"yellow",italic:false}]}}}

kill @s
