# Drop exactly the stored count, remove this Ghast's mounted displays, then explode.
$summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:$(n)}}
kill @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..12]
scoreboard players set @s ghast_tnt 0
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.8
summon minecraft:tnt ~ ~ ~ {fuse:10s,Tags:["nuke_boom"]}
kill @s
