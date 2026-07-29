# Маркер пережил блок максимум до этого тика: сразу чистим связанные interaction.
kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]

# TNT-ловушка срабатывает только без окна, выданного правильным ключом.
execute if entity @s[tag=ms_safe_mine] unless score @s mosseater.safe_auth matches 1.. run return run function mosseater:safe/trap_detonate

kill @e[distance=..1.2,nbt={Item:{id:"minecraft:chest"}},limit=1,sort=nearest,type=minecraft:item]
summon minecraft:item ~ ~ ~ {Tags:["ms_safe_drop"],Item:{id:"minecraft:chest",count:1,components:{"minecraft:custom_data":{mosseater_safe:1b},"minecraft:item_name":{text:"Сундук с Паролем",color:"gold",italic:false},"minecraft:lore":[{text:"Поставьте, чтобы настроить сейф",color:"gray",italic:false}]}}}
kill @s
