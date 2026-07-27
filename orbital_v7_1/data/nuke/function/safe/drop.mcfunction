# Сейф разрушен/взорван. Контекст: as <marker safe_box>, at @s.
# Убираем ванильный дроп сундука и даём КАСТОМНЫЙ предмет Сейфа.
kill @e[type=minecraft:item,distance=..2,nbt={Item:{id:"minecraft:chest"}},tag=!safe_drop]
summon minecraft:item ~ ~ ~ {Tags:["safe_drop"],Item:{id:"minecraft:chest",count:1,components:{"minecraft:custom_data":{safe_box:true},"minecraft:item_name":'{"text":"Сундук с Паролем","color":"gold","italic":false}'}}}
kill @e[type=minecraft:interaction,tag=safe_shield,distance=..2]
kill @s
