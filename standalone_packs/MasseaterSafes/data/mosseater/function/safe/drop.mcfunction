# Маркер пережил блок максимум до этого тика: сразу чистим связанные interaction.
kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
kill @e[distance=..1.2,nbt={Item:{id:"minecraft:chest"}},limit=1,sort=nearest,type=minecraft:item]
summon minecraft:item ~ ~ ~ {Tags:["ms_safe_drop"],Item:{id:"minecraft:chest",count:1,components:{"minecraft:custom_data":{mosseater_safe:1b},"minecraft:item_name":{text:"Сундук с Паролем",color:"gold",italic:false},"minecraft:lore":[{text:"Поставьте, чтобы настроить сейф",color:"gray",italic:false}]}}}
kill @s
