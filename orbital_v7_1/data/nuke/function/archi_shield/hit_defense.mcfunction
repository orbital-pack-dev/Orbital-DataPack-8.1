# Сработка защиты Архи-Щита. Контекст: as <игрок>, at @s.
execute if score @s archi_delay matches 1.. run return 0

# Кулдаун из настроек (по умолчанию 100 тиков).
scoreboard players set @s archi_delay 100
execute if score nuke.cfg.archi_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = nuke.cfg.archi_cd nuke.settings

# Отброс атакующих + шипы.
function nuke:archi_shield/knockback_and_thorns

# Личная защита владельца.
effect give @s minecraft:resistance 3 2 true
effect give @s minecraft:absorption 8 1 true

particle minecraft:flash ~ ~1 ~ 0 0 0 1 1 force
particle minecraft:end_rod ~ ~1 ~ 1 1 1 30 0.05 force
playsound minecraft:item.shield.block master @a[distance=..16] ~ ~ ~ 1 0.7
title @s actionbar {"text":"АРХИ-ЩИТ: защита сработала","color":"aqua","bold":true}

# Износ щита за сработку (в любой руке).
execute if items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] run item modify entity @s weapon.mainhand nuke:damage_shield
execute unless items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1b}] run item modify entity @s weapon.offhand nuke:damage_shield
