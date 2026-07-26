# Вызывается из #minecraft:load — при старте сервера и каждом /reload.

# 1) ВСЕ кастомные рецепты выдаются всем игрокам.
recipe give @a *
tag @a add nuke_recipes

# 2) КРИТИЧНО (Аудит-4): переобъявляем статистические объективы С ПРАВИЛЬНЫМИ
# критериями. Именно из-за критерия dummy Архи-Щит был мёртв:
# damage_taken никогда не рос сам, а значит hit_defense не вызывался никогда.
scoreboard objectives remove damage_taken
scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives remove damage_blocked_by_shield
scoreboard objectives add damage_blocked_by_shield minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives remove shield_used
scoreboard objectives add shield_used minecraft.used:minecraft.shield

# sneak_time теперь считается САМИМ датапаком (dummy) — никакой зависимости
# от ванильной статистики и её единиц измерения.
scoreboard objectives remove sneak_time
scoreboard objectives add sneak_time dummy

# 3) Служебные константы для деления/остатка.
scoreboard players set #20 nuke.settings 20
scoreboard players set #four nuke.settings 4
