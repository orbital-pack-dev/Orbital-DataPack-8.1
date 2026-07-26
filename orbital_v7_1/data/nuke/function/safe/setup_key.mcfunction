function nuke:give/safe_key_blank
title @s actionbar {"text":"Переименуйте болванку в Наковальне и кликните по сундуку!","color":"yellow"}
playsound minecraft:block.anvil.use master @s ~ ~ ~ 1 1
execute as @e[type=interaction,tag=safe_setup,distance=..6,sort=nearest,limit=1] run tag @s remove safe_setup
execute as @e[type=interaction,tag=safe_shield,distance=..6,sort=nearest,limit=1] run tag @s add safe_awaiting_key
