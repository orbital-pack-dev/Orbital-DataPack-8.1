# interaction.player появляется после ПКМ и обрабатывается ровно один раз.
execute as @e[tag=ms_safe_shield,nbt={interaction:{}},type=minecraft:interaction] at @s run function mosseater:safe/on_interact

# МОДУЛЬ 2. Пересчёт плотности склада раз в 60 тиков, а не каждый тик.
scoreboard players remove #density_timer mosseater.safe_config 1
execute if score #density_timer mosseater.safe_config matches ..0 run function mosseater:safe/density_pass

# Флаг медленного прохода защиты (боковые воронки, выброс ключей): раз в 10 тиков.
# Счётчики самоинициализируются: scoreboard players remove трактует
# отсутствующее значение как 0, поэтому load для них не обязателен.
scoreboard players set #protect_now mosseater.safe_config 0
scoreboard players remove #protect_timer mosseater.safe_config 1
execute if score #protect_timer mosseater.safe_config matches ..0 run scoreboard players set #protect_timer mosseater.safe_config 10
execute if score #protect_timer mosseater.safe_config matches 10 run scoreboard players set #protect_now mosseater.safe_config 1

# КРИТИЧНО 2 и 3. Глобальные проходы по сущностям-нарушителям.
#
# Стоимость этих строк — O(число нарушителей), а НЕ O(число сейфов). На складе
# из 500 сейфов без единой вагонетки и ТНТ здесь не выполняется ни одной
# проверки радиуса: селектор по type просто возвращает пустой список. Именно
# поэтому не спавнятся отдельные маркеры-антиТНТ: каждый лишний маркер — это
# постоянная нагрузка, а проход по ТНТ стоит ноль, пока ТНТ нет.
execute as @e[type=minecraft:hopper_minecart] at @s run function mosseater:safe/purge_cart
execute as @e[type=minecraft:chest_minecart] at @s run function mosseater:safe/purge_cart
execute as @e[type=minecraft:tnt,tag=!ms_safe_mine] at @s run function mosseater:safe/purge_tnt
execute as @e[type=minecraft:tnt_minecart] at @s run function mosseater:safe/purge_tnt

# Каждый блок-половина имеет собственный marker состояния.
execute as @e[tag=ms_safe_box,type=minecraft:marker] at @s run function mosseater:safe/tick_one
