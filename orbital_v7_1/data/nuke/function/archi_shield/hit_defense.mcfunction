# Срабатывание защиты Архи-Щита. Контекст: as <игрок>, at @s.
execute if score @s archi_delay matches 1.. run return 0

# Кулдаун из настроек, с безопасным значением по умолчанию.
scoreboard players set @s archi_delay 100
execute if score archi_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = archi_cd nuke.settings
execute if score nuke.cfg.archi_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = nuke.cfg.archi_cd nuke.settings

# Тег нужен, чтобы урон шипов был засчитан ИМЕННО этому игроку.
tag @s add archi_user

effect give @s minecraft:resistance 3 1 true
effect give @s minecraft:absorption 6 0 true
particle minecraft:flash ~ ~1 ~ 0 0 0 0 1
particle minecraft:end_rod ~ ~1 ~ 0.6 0.6 0.6 40 0.15
playsound minecraft:block.beacon.deactivate player @a[distance=..24] ~ ~ ~ 1 1.4

function nuke:archi_shield/knockback_and_thorns
function nuke:archi_shield/reset_cooldown

tag @s remove archi_user
