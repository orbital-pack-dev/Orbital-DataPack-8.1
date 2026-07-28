# Контекст: as <игрок>, at <игрок>.
function mosseater:give/safe_key_blank
title @s actionbar {text:"Переименуйте болванку в Наковальне и кликните по сундуку!",color:"yellow"}
playsound minecraft:block.anvil.use master @s ~ ~ ~ 1 1

execute as @e[type=interaction,tag=ms_safe_setup,distance=..6,sort=nearest,limit=1] at @s run function mosseater:safe/setup_key_arm
