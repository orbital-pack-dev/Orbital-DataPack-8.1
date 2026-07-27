# Мгновенный сброс ТНТ предметами, очистка дисплеев и подрыв. Контекст: as <Гаст>, at @s.
$summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",count:$(n)}}

# Гарантированная очистка: сначала все пассажиры-дисплеи этого носителя,
# затем страховочный радиус от возможных отцепившихся остатков.
execute on passengers if entity @s[type=minecraft:block_display,tag=ghast_tnt_display] run kill @s
kill @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..2]
scoreboard players set @s ghast_tnt 0

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.8
summon minecraft:tnt ~ ~ ~ {fuse:0s,Tags:["nuke_boom"]}
kill @s
