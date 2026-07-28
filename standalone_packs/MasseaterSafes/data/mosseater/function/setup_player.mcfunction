# Однократная инициализация игрока.
tag @s add ms_recipes
recipe give @s mosseater:safe_chest
scoreboard players set @s mosseater.safe_data 0
function mosseater:enable_triggers
