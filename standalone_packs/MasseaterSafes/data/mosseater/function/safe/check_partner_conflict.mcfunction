# МОДУЛЬ 3 — обе половины уже имеют маркеры.
# Контекст: as <маркер-донор>, positioned <центр второй половины>.
#
# Матрица решений:
#   донор настроен + половина настроена  -> сравниваем пароли по NBT
#   донор настроен + половина не настроена -> ломаем половину
#   донор не настроен + половина настроена -> ничего не делаем: обратный проход
#     от настроенного маркера обработает эту же пару и сломает именно
#     незавершённую половину, а не рабочий сейф
#   обе не настроены -> это одна и та же пара, созданная init_partner
execute unless entity @s[tag=ms_safe_configured] run return 0
execute unless entity @e[tag=ms_safe_box,tag=ms_safe_configured,distance=..0.7,limit=1,type=minecraft:marker] run return run function mosseater:safe/break_unconfigured_partner

# Сравнение паролей идёт как NBT-равенство через storage. Строка пароля никогда
# не попадает в текст команды, поэтому корректны цифры, буквы и любые символы.
data remove storage mosseater:safe merge
data modify storage mosseater:safe merge.a set from entity @s data.safe.password
data modify storage mosseater:safe merge.b set from entity @e[tag=ms_safe_box,tag=ms_safe_configured,distance=..0.7,limit=1,type=minecraft:marker] data.safe.password
data modify storage mosseater:safe merge.cmp set from storage mosseater:safe merge.a

# data modify возвращает success=0, если значение не изменилось.
# Значит 1 == пароли различаются.
scoreboard players set #merge_diff mosseater.safe_config 0
execute store success score #merge_diff mosseater.safe_config run data modify storage mosseater:safe merge.cmp set from storage mosseater:safe merge.b
data remove storage mosseater:safe merge

execute if score #merge_diff mosseater.safe_config matches 1 run function mosseater:safe/break_password_conflict
