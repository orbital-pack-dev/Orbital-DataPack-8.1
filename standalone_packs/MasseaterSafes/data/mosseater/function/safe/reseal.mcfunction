# Контекст: as <маркер>, at <центр блока>.
# Вызывается вне окна доступа и НЕ зависит от дистанции игрока: ранее замок
# возвращался только при distance >= 4, поэтому сейф мог остаться открытым
# навсегда, если владелец не отходил от него.
execute if entity @s[tag=ms_safe_keep_open] run return 0
execute unless entity @s[tag=ms_safe_configured] run return 0

# Пока lock присутствует, relock не вызывается, поэтому нет спама звуком.
execute unless data block ~ ~ ~ Lock run function mosseater:safe/relock
