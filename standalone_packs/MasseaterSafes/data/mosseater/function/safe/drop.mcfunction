# Маркер пережил блок максимум до этого тика.
#
# МОДУЛЬ 4. Детонация выполняется ДО очистки сущностей, пока состояние мины
# ещё доступно. Условия детонации: заряд был внутри, окно доступа закрыто и
# авторизации ms_safe_auth нет. Сейф в режиме keep_open никогда не минируется.
execute if entity @s[tag=ms_safe_trapped] unless entity @s[tag=ms_safe_auth] unless entity @s[tag=ms_safe_keep_open] unless score @s mosseater.safe_data matches 1.. run function mosseater:safe/trap_detonate

kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
kill @e[distance=..1.2,nbt={Item:{id:"minecraft:chest"}},limit=1,sort=nearest,type=minecraft:item]
summon minecraft:item ~ ~ ~ {Tags:["ms_safe_drop"],Item:{id:"minecraft:chest",count:1,components:{"minecraft:custom_data":{mosseater_safe:1b},"minecraft:item_name":{text:"Сундук с Паролем",color:"gold",italic:false},"minecraft:lore":[{text:"Поставьте, чтобы настроить пароль",color:"gray",italic:false},{text:"Пароль = имя Ключа из наковальни",color:"gray",italic:false},{text:"Совет: добавляйте буквы, а не только цифры",color:"yellow",italic:false}]}}}
kill @s
