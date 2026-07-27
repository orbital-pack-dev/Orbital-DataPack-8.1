# Цикл детонации Гаста: один вызов = один заряд ТНТ.
# Контекст: at <точка взрыва>. Счётчик — #gh_left nuke.settings (= ghast_tnt).
# Заряды раскладываются крестом по остатку от деления на 4, чтобы воронка росла
# в ширину, а не только в глубину: 14 ТНТ = 14 реальных взрывов вместо одного.
execute unless score #four nuke.settings matches 4 run scoreboard players set #four nuke.settings 4
scoreboard players operation #gh_mod nuke.settings = #gh_left nuke.settings
scoreboard players operation #gh_mod nuke.settings %= #four nuke.settings

execute if score #gh_mod nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}
execute if score #gh_mod nuke.settings matches 1 run summon minecraft:tnt ~0.8 ~ ~ {fuse:1s,Tags:["nuke_boom"]}
execute if score #gh_mod nuke.settings matches 2 run summon minecraft:tnt ~-0.8 ~ ~ {fuse:1s,Tags:["nuke_boom"]}
execute if score #gh_mod nuke.settings matches 3 run summon minecraft:tnt ~ ~ ~0.8 {fuse:1s,Tags:["nuke_boom"]}

scoreboard players remove #gh_left nuke.settings 1
execute if score #gh_left nuke.settings matches 1.. run function nuke:happy_ghast/blow_loop
