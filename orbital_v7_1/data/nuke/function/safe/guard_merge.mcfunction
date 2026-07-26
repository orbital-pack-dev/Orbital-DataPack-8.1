# Защита сейфа от объединения в двойной сундук.
# Вызывается достижением nuke:chest_placed при установке ЛЮБОГО сундука.
# Контекст: as <игрок>.
advancement revoke @s only nuke:chest_placed
scoreboard players set @s raycast_limit 30
execute at @s anchored eyes positioned ^ ^ ^ run function nuke:safe/guard_merge_loop
