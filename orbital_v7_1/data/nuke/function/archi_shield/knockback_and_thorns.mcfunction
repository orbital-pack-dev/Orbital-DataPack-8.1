# ARCHI-SHIELD: KNOCKBACK + THORNS (Rate-limited for balance)
# Runs AS target mob AT target mob's position

# Rate-limit Thorns damage: check if timer is 0
scoreboard players add @s nuke.bd_count 0
execute if score @s nuke.bd_count matches 1.. run scoreboard players remove @s nuke.bd_count 1
execute if score @s nuke.bd_count matches 0 run damage @s 2 minecraft:generic by @p[distance=..8,limit=1]
execute if score @s nuke.bd_count matches 0 run playsound minecraft:enchant.thorns.hit player @a ~ ~ ~ 1.0 1.0
execute if score @s nuke.bd_count matches 0 run scoreboard players set @s nuke.bd_count 12

particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0.05 4

# Knockback
execute as @p[distance=..8,limit=1] at @s positioned 0.0 0.0 0.0 rotated as @s run summon marker ^ ^ ^0.9 {Tags:["orb_push_vec"]}
data modify entity @s Motion set from entity @e[type=marker,tag=orb_push_vec,limit=1] Pos
kill @e[type=marker,tag=orb_push_vec]
