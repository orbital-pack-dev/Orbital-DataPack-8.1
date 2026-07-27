# ЗАДАЧА 1 — ОБРАБОТКА ТУМБЛЕРА ОРБИТАЛЬНОГО КОМПЛЕКСА.
# Кнопки меню: /trigger t_orbital_enabled set 1 — ВКЛ, set 2 — ВЫКЛ.

execute if entity @a[scores={t_orbital_enabled=1}] run scoreboard players set #orbital_enabled nuke.config 1
execute if entity @a[scores={t_orbital_enabled=1}] run recipe give @a nuke:stabshot
execute if entity @a[scores={t_orbital_enabled=1}] run recipe give @a nuke:withershot
execute if entity @a[scores={t_orbital_enabled=1}] run recipe give @a nuke:fireshot
execute as @a[scores={t_orbital_enabled=1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Орбитальный комплекс ВКЛЮЧЁН.","color":"green"}]

execute if entity @a[scores={t_orbital_enabled=2..}] run scoreboard players set #orbital_enabled nuke.config 0
execute as @a[scores={t_orbital_enabled=2..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Орбитальный комплекс ВЫКЛЮЧЕН: рецепты сняты, пушки в выживании ломаются.","color":"red"}]

execute as @a[scores={t_orbital_enabled=1..}] run dialog show @s nuke:orbital_enabled
scoreboard players reset @a t_orbital_enabled

# Каждый тик синхронизируем меню -> глобальные флаги.
function nuke:settings/sync_config
