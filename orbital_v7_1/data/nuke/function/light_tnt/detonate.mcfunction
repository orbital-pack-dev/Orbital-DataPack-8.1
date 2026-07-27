# Контекст: as <block_display lt_display>, at @s. Снаряд схлопнулся — взрыв.
particle minecraft:explosion ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..32] ~ ~ ~ 1 1.4
summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}
kill @s
