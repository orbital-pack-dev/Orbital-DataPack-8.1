data modify entity @s width set value 0.0f
data modify entity @s height set value 0.0f
schedule function nuke:safe/restore_hitbox 60t append
title @p actionbar {"text":"Ключ принят! Откройте сундук (3 сек).","color":"green"}
playsound minecraft:block.iron_door.open master @p ~ ~ ~ 1 2
