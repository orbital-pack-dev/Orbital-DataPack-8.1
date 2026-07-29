# Контекст: as/at <игрок>.
execute as @e[tag=ms_safe_setup,distance=..6,sort=nearest,limit=1,type=minecraft:interaction] at @s run function mosseater:safe/leave_open
title @s actionbar {text:"Сейф оставлен открытым. Защита включится через 3 секунды.",color:"gray"}
