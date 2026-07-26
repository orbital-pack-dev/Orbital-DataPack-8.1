# Шипы + отбрасывание. Контекст: as цель, at цель.
# Хак с summon marker в точке 0 0 0 удалён: он грузил чанк спавна каждый удар.
# Ванильный тип урона player_attack сам даёт отбрасывание и зачёт убийства игроку.
scoreboard players add @s nuke.bd_count 0
execute if score @s nuke.bd_count matches 1.. run scoreboard players remove @s nuke.bd_count 1
execute if score @s nuke.bd_count matches 1.. run return fail

execute if entity @a[tag=archi_user,limit=1] run damage @s 4 minecraft:player_attack by @a[tag=archi_user,limit=1]
execute unless entity @a[tag=archi_user] run damage @s 4 minecraft:mob_attack

playsound minecraft:enchant.thorns.hit player @a ~ ~ ~ 1.0 1.0
particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0.05 4
scoreboard players set @s nuke.bd_count 12
