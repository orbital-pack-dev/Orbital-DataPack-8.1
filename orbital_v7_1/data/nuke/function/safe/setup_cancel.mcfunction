title @s actionbar {"text":"Сундук оставлен открытым.","color":"gray"}
execute as @e[type=interaction,tag=safe_setup,distance=..6,sort=nearest,limit=1] run kill @s
