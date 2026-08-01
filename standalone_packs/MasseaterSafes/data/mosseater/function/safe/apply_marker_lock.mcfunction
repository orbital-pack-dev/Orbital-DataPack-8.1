# Контекст: as <configured marker>, at <центр его блока>.
data modify storage mosseater:safe key.password set from entity @s data.safe.password
execute unless data storage mosseater:safe key.password run return 0

# Повторное запечатывание использует ту же атомарную структуру lock.
# Побочный эффект миграции: сейфы, запертые до перехода на echo_shard,
# сами перезаписывают свой lock на тег при первом же авто-запечатывании.
data modify storage mosseater:safe lock_temp set value {items:"#mosseater:safe_keys",components:{},predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
data modify storage mosseater:safe lock_temp.components."minecraft:custom_name" set from storage mosseater:safe key.password
execute align xyz run data modify block ~ ~ ~ components."minecraft:lock" set from storage mosseater:safe lock_temp

data remove storage mosseater:safe lock_temp
data remove storage mosseater:safe key
