# Контекст: as <Гаст>, at @s. Макрос нужен только ради count в дропе.
$summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:$(n),components:{"minecraft:custom_data":{happy_tnt:1b},"minecraft:item_name":'{"text":"Динамит Гаста","color":"red","italic":false}'}}}
kill @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..12]
scoreboard players set @s ghast_tnt 0
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.8
summon minecraft:tnt ~ ~ ~ {fuse:10s,Tags:["nuke_boom"]}
kill @s
