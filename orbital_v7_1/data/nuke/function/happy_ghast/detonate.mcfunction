# Цепной взрыв Счастливого Гаста-Камикадзе
particle explosion_emitter ~ ~1 ~ 4 4 4 0 12
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 5 0.8
playsound minecraft:entity.ghast.scream master @a ~ ~ ~ 4 1.2

execute if score @s ghast_tnt matches 1..4 as @e[distance=0.1..10,type=!player,type=!#nuke:technical,type=!item] run damage @s 40 minecraft:explosion by @p[limit=1]
execute if score @s ghast_tnt matches 5..9 as @e[distance=0.1..15,type=!player,type=!#nuke:technical,type=!item] run damage @s 80 minecraft:explosion by @p[limit=1]
execute if score @s ghast_tnt matches 10..14 as @e[distance=0.1..22,type=!player,type=!#nuke:technical,type=!item] run damage @s 150 minecraft:explosion by @p[limit=1]

kill @e[type=block_display,tag=ghast_tnt_display,distance=..8]
kill @s
