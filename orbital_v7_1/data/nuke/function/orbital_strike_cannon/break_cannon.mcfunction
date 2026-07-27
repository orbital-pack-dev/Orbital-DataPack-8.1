# ЗАДАЧА 1 — ПУШКА ЛОМАЕТСЯ В РУКАХ.
# Контекст: as <игрок НЕ в креативе>. Если комплекс выключен, орбитальная
# пушка физически рассыпается в руках и использовать её невозможно.
execute unless items entity @s weapon.mainhand minecraft:fishing_rod[custom_data~{stabshot:1b}] unless items entity @s weapon.mainhand minecraft:fishing_rod[custom_data~{nukeshot:1b}] unless items entity @s weapon.mainhand minecraft:fishing_rod[custom_data~{withershot:1b}] unless items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{stabshot:1b}] unless items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{nukeshot:1b}] unless items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{withershot:1b}] run return 0

execute at @s run playsound minecraft:entity.item.break player @a[distance=..12] ~ ~ ~ 1 0.8
execute at @s run particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.05 12 force
title @s actionbar {"text":"⛔ Орбитальный комплекс отключён — пушка рассыпалась в руках","color":"red"}

execute if items entity @s weapon.mainhand minecraft:fishing_rod[custom_data~{stabshot:1b}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.mainhand minecraft:fishing_rod[custom_data~{nukeshot:1b}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.mainhand minecraft:fishing_rod[custom_data~{withershot:1b}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{stabshot:1b}] run item replace entity @s weapon.offhand with air
execute if items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{nukeshot:1b}] run item replace entity @s weapon.offhand with air
execute if items entity @s weapon.offhand minecraft:fishing_rod[custom_data~{withershot:1b}] run item replace entity @s weapon.offhand with air

scoreboard players set @s use_rod 0
