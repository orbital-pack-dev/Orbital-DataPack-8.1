# Контекст: маркер сейфа после того, как его сундук исчез.
kill @e[type=minecraft:item,distance=..1.6,nbt={Item:{id:"minecraft:chest"}},limit=1,sort=nearest]
summon minecraft:item ~ ~ ~ {Tags:["ms_safe_drop"],Item:{id:"minecraft:chest",count:1,components:{"minecraft:custom_data":{mosseater_safe:1b},"minecraft:item_name":{text:"Сундук с Паролем",color:"gold",italic:false},"minecraft:lore":[{text:"Поставьте, чтобы установить пароль",color:"gray",italic:false}]}}}
kill @e[type=minecraft:interaction,tag=ms_safe_shield,distance=..1.6]
kill @s
