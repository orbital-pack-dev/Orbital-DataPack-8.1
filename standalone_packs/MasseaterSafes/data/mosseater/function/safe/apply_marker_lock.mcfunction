# Контекст: as <configured marker>, at <центр его блока>.
data modify storage mosseater:safe key.password set from entity @s data.safe.password
execute unless data storage mosseater:safe key.password run return 0

# Повторное запечатывание использует ту же атомарную структуру lock.
# Побочный эффект миграции: сейфы, запертые до перехода на echo_shard,
# сами перезаписывают свой lock на тег при первом же авто-запечатывании.
execute align xyz run data merge block ~ ~ ~ {Lock:"SAFE_LOCKED"}
data remove storage mosseater:safe key
