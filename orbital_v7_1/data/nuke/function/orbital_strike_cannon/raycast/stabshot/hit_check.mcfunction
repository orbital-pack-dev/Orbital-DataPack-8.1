execute unless block ~ ~ ~ air run return run function nuke:orbital_strike_cannon/raycast/stabshot/impact
execute if score @s raycast_limit matches 180.. run return run function nuke:orbital_strike_cannon/raycast/stabshot/impact

scoreboard players add @s raycast_limit 1
execute positioned ^ ^ ^0.8 run function nuke:orbital_strike_cannon/raycast/stabshot/hit_check
