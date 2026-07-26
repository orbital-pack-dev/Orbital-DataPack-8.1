# Имитация взрыва без разрушения блоков
particle explosion_emitter ~ ~ ~ 1 1 1 0.1 1 force
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4 1
execute as @e[distance=..8,type=!item] run damage @s 20 minecraft:explosion by @p[limit=1]
kill @s
