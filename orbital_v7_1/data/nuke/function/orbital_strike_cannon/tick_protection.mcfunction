# Защита блоков: все взрывы датапака переводятся в безопасный режим,
# если флаг включён. Это страховка от ванильных сущностей, которые успели
# спавнуться в обход гейта (например, флаг переключили в тот же тик).
execute unless score #block_protection nuke.config matches 0.. run scoreboard players operation #block_protection nuke.config = block_protection nuke.settings
execute if score #block_protection nuke.config matches 1 as @e[type=minecraft:tnt,tag=nuke_boom] at @s run function nuke:orbital_strike_cannon/safe_tnt
execute if score #block_protection nuke.config matches 1 as @e[type=minecraft:tnt,tag=tt_boom] at @s run function nuke:orbital_strike_cannon/safe_tnt
execute if score #block_protection nuke.config matches 1 as @e[type=minecraft:tnt,tag=fs_boom] at @s run function nuke:orbital_strike_cannon/safe_tnt
execute if score #block_protection nuke.config matches 1 as @e[type=minecraft:tnt,tag=bv_boom] at @s run function nuke:orbital_strike_cannon/safe_tnt
