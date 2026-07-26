# Контекст: as <игрок>, at <игрок>.
function nuke:give/safe_key_blank
title @s actionbar {"text":"Переименуйте болванку в Наковальне и кликните по сундуку!","color":"yellow"}
playsound minecraft:block.anvil.use master @s ~ ~ ~ 1 1

# Один и тот же маркер должен и потерять safe_setup, и получить safe_awaiting_key.
# Раньше это были две независимые выборки @e, которые могли попасть в РАЗНЫЕ
# сущности и оставить сейф в нерабочем состоянии.
execute as @e[type=interaction,tag=safe_setup,distance=..6,sort=nearest,limit=1] at @s run function nuke:safe/setup_key_arm
