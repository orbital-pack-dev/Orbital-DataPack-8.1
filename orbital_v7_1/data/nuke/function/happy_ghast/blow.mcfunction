# Drop exactly the stored count and remove only this Ghast's passengers.
$summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:$(n)}}
execute on passengers if entity @s[type=minecraft:block_display,tag=ghast_tnt_display] run kill @s
scoreboard players set @s ghast_tnt 0
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.8
summon minecraft:tnt ~ ~ ~ {fuse:10s,Tags:["nuke_boom"]}
kill @s
