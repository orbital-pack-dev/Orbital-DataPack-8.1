# Контекст: as <маркер половины>, at <его блок>.
# Пароль сначала сохраняется в persistent NBT маркера.
data modify entity @s data.safe.password set from storage mosseater:safe key.password
data modify entity @s data.safe.keep_open set value 0b
tag @s remove ms_safe_unconfigured
tag @s remove ms_safe_keep_open
tag @s add ms_safe_configured

# minecraft:lock — ItemStack predicate. Структура собирается целиком в storage,
# после чего атомарно записывается в block entity без изменения глубокого пути.
data modify storage mosseater:safe lock_temp set value {items:"minecraft:tripwire_hook",components:{},predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
data modify storage mosseater:safe lock_temp.components."minecraft:custom_name" set from storage mosseater:safe key.password
execute align xyz run data modify block ~ ~ ~ components."minecraft:lock" set from storage mosseater:safe lock_temp
data remove storage mosseater:safe lock_temp
