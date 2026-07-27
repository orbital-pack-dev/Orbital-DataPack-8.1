# Дроп ТНТ → очистка дисплеев → детонация. Контекст: as <Гаст>, at @s.
# 1) СНАЧАЛА выбрасываем ровно столько предметов ТНТ, сколько было навешано (1..14).
$summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:tnt",count:$(n)},Motion:[0.0d,0.35d,0.0d]}

# 2) Гарантированная очистка визуала: пассажиры-дисплеи + страховочный радиус.
execute on passengers if entity @s[type=minecraft:block_display,tag=ghast_tnt_display] run kill @s
kill @e[type=minecraft:block_display,tag=ghast_tnt_display,distance=..2]

# 3) ДИНАМИЧЕСКАЯ ДЕТОНАЦИЯ: раньше были жёсткие пороги (5../10../14),
# из-за чего 1 и 14 зарядов давали практически одинаковую воронку.
# Теперь количество зарядов СТРОГО равно ghast_tnt (циклический вызов blow_loop).
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.8
scoreboard players operation #gh_left nuke.settings = @s ghast_tnt
execute unless score #gh_left nuke.settings matches 1.. run scoreboard players set #gh_left nuke.settings 1
function nuke:happy_ghast/blow_loop
scoreboard players set @s ghast_tnt 0
kill @s
