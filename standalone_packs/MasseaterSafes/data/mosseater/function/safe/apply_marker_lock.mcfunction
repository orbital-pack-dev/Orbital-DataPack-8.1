# Контекст: as <configured marker>, at <центр его блока>.
data modify storage mosseater:safe key.password set from entity @s data.safe.password
execute unless data storage mosseater:safe key.password run return 0

# Повторное запечатывание использует ту же атомарную структуру lock.
data modify storage mosseater:safe lock_temp set value {items:"minecraft:tripwire_hook",components:{},predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
data modify storage mosseater:safe lock_temp.components."minecraft:custom_name" set from storage mosseater:safe key.password
execute align xyz run data modify block ~ ~ ~ components."minecraft:lock" set from storage mosseater:safe lock_temp

data remove storage mosseater:safe lock_temp
data remove storage mosseater:safe key
