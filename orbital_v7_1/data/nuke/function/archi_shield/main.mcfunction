# АРХИ-ЩИТ, основной тик. Контекст: as игрок, at игрок.
# Причина полной неработоспособности модуля была в рассинхроне custom_data:
# выдавался {archi_shield:1b} (byte), а проверялся {archi_shield:1} (int).
# Теперь везде int 1.

scoreboard players remove @s[scores={archi_delay=1..}] archi_delay 1

# Реакция на полученный / заблокированный урон
execute if score @s damage_taken matches 1.. at @s run function nuke:archi_shield/hit_defense
execute unless score @s damage_taken matches 1.. if score @s damage_blocked_by_shield matches 1.. at @s run function nuke:archi_shield/hit_defense

# Активный режим по шифту. sneak_time раньше нигде не считался, поэтому
# стена частиц и отбрасывание не срабатывали вообще.
execute if predicate nuke:is_sneaking run scoreboard players add @s sneak_time 1
execute unless predicate nuke:is_sneaking run scoreboard players set @s sneak_time 0
execute if predicate nuke:is_sneaking at @s run function nuke:archi_shield/sneak_active

# Аура
execute at @s run particle minecraft:nautilus ~ ~1 ~ 0.6 0.5 0.6 0.02 2
execute at @s run particle minecraft:enchant ~ ~1 ~ 0.5 0.5 0.5 0.05 2
