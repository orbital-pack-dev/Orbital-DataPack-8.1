# Входной параметр: @s nuke.xp_cost (ставится вызывающей функцией ДО этого вызова)
# Результат: @s nuke.action_ok = 1 (можно) | 0 (отказ, XP не списан)

# ── VIP bypass (если включён переключателем) ──────────
execute if score nuke.cfg.vip nuke.settings matches 1 if entity @s[name=Void7676_] run scoreboard players set @s nuke.action_ok 1
execute if score nuke.cfg.vip nuke.settings matches 1 if entity @s[name=Black_Noir] run scoreboard players set @s nuke.action_ok 1
execute if score @s nuke.action_ok matches 1 run return 0

# ── Проверка уровней против nuke.xp_cost ─────────────
execute store result score @s xp_level run experience query @s levels
execute if score @s xp_level >= @s nuke.xp_cost run return run function nuke:spend_xp

title @s actionbar ["",{"text":"⛔ Нужно ","color":"red"},{"score":{"name":"@s","objective":"nuke.xp_cost"}},{"text":" ур. опыта. Сейчас: ","color":"red"},{"score":{"name":"@s","objective":"xp_level"},"color":"yellow"}]
