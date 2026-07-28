# Контекст: as <маркер>, at <блок>. Вызывается только при отсутствии игрока в ..4.
execute if entity @s[tag=ms_safe_keep_open] run return 0
execute unless entity @s[tag=ms_safe_configured] run return 0

# Lock восстанавливается из NBT состояния маркера; чужой пароль не подходит.
execute unless data block ~ ~ ~ components."minecraft:lock" run function mosseater:safe/relock
function mosseater:safe/ensure_interaction
