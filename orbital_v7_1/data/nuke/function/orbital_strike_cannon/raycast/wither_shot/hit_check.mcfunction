execute unless block ~ ~ ~ air run return run function nuke:orbital_strike_cannon/raycast/wither_shot/impact
execute if score @s raycast_limit matches 180.. run return run function nuke:orbital_strike_cannon/raycast/wither_shot/impact

scoreboard players add @s raycast_limit 1
execute positioned ^ ^ ^0.8 run function nuke:orbital_strike_cannon/raycast/wither_shot/hit_check
