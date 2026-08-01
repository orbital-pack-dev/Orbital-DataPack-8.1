# Совместимый вход для legacy-вызовов. Требуется storage key.password.
execute unless data storage mosseater:safe key.password run return 0

data modify storage mosseater:safe lock_temp set value {items:"#mosseater:safe_keys",components:{},predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
data modify storage mosseater:safe lock_temp.components."minecraft:custom_name" set from storage mosseater:safe key.password
execute align xyz run data modify block ~ ~ ~ components."minecraft:lock" set from storage mosseater:safe lock_temp
data remove storage mosseater:safe lock_temp
