# Контекст: as <игрок>, at <игрок>.
execute as @e[type=minecraft:interaction,tag=ms_safe_setup,distance=..6,sort=nearest,limit=1] at @s run function mosseater:safe/leave_open
title @s actionbar {text:"Сейф оставлен без персонального пароля.",color:"gray"}
