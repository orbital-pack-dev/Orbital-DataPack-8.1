# Имитация взрыва без разрушения блоков. @s = сущность tnt.
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0.1 1 force
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4 1
execute as @e[distance=..8,type=!tnt,type=!item,type=!marker,type=!block_display,type=!text_display,type=!interaction,type=!experience_orb,type=!area_effect_cloud] run damage @s 20 minecraft:explosion
kill @s
