# Fallback: item_used_on_block может сработать до окончательной постановки блока.
# Поэтому только помечаем игрока, а сканирование выполняем на следующем тике.
advancement revoke @s only mosseater:safe_place_fallback
tag @s add ms_safe_place_pending
