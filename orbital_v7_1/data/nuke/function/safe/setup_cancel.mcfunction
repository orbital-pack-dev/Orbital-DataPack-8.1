# Atomically transition this exact setup interaction to persistent open state.
execute as @e[type=minecraft:interaction,tag=safe_setup,distance=..6,sort=nearest,limit=1] at @s run function nuke:safe/leave_open
title @s actionbar {"text":"Сейф оставлен без персонального пароля.","color":"gray"}
