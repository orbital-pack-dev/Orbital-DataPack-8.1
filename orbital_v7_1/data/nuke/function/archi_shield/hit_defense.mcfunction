# Срабатывание защиты Архи-Щита. Контекст: as игрок, at игрок.
execute if score personal_cd nuke.settings matches 1.. if score @s archi_delay matches 1.. run title @s actionbar {"text":"АРХИ-ЩИТ: перезарядка","color":"gold"}
execute if score personal_cd nuke.settings matches 1.. if score @s archi_delay matches 1.. run return fail

# Проверка и списание опыта
scoreboard players operation @s nuke.xp_cost = nuke.cfg.xp_archi nuke.settings
scoreboard players set @s nuke.action_ok 0
function nuke:check_xp
execute if score @s nuke.action_ok matches 0 run return fail

# Снятие ванильного кулдауна щита, иначе блок ломается на следующем ударе
function nuke:archi_shield/reset_cooldown

effect give @s minecraft:instant_health 1 255 true
effect give @s minecraft:resistance 1 4 true
playsound minecraft:item.shield.block player @a ~ ~ ~ 1.0 1.0
particle minecraft:enchanted_hit ~ ~1 ~ 0.4 0.4 0.4 0.05 10 force
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.3 0.3 0.03 6 force

execute if score personal_cd nuke.settings matches 1.. run scoreboard players operation @s archi_delay = nuke.cfg.archi_cd nuke.settings
