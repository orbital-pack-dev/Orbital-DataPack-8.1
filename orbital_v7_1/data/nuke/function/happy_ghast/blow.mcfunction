# Дроп ТНТ → очистка дисплеев → детонация. Контекст: as <Гаст>, at @s.
# 1) СНАЧАЛА выбрасываем ровно столько предметов ТНТ, сколько было навешено (1..14).
$summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:tnt",count:$(n)},Motion:[0.0d,0.35d,0.0d]}

# 2) Гарантированная очистка визуала: пассажиры-дисплеи + страховочный радиус.
execute on passengers if entity @s[type=minecraft:block_display,tag=ghast_tnt_display] run kill @s
kill @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..2]

# 3) Самодетонация с мощностью, пропорциональной количеству зарядов.
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.8
summon minecraft:tnt ~ ~ ~ {fuse:0s,Tags:["nuke_boom"]}
execute if score @s ghast_tnt matches 5.. run summon minecraft:tnt ~0.6 ~ ~ {fuse:1s,Tags:["nuke_boom"]}
execute if score @s ghast_tnt matches 5.. run summon minecraft:tnt ~-0.6 ~ ~ {fuse:1s,Tags:["nuke_boom"]}
execute if score @s ghast_tnt matches 10.. run summon minecraft:tnt ~ ~ ~0.6 {fuse:2s,Tags:["nuke_boom"]}
execute if score @s ghast_tnt matches 10.. run summon minecraft:tnt ~ ~ ~-0.6 {fuse:2s,Tags:["nuke_boom"]}
execute if score @s ghast_tnt matches 14 run summon minecraft:tnt ~ ~0.6 ~ {fuse:3s,Tags:["nuke_boom"]}
scoreboard players set @s ghast_tnt 0
kill @s
