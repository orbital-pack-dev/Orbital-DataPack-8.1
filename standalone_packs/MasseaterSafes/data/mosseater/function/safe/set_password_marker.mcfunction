# Контекст: as <маркер половины>, at <его блок>.
# Пароль сначала сохраняется в persistent NBT маркера.
data modify entity @s data.safe.password set from storage mosseater:safe key.password
data modify entity @s data.safe.keep_open set value 0b
tag @s remove ms_safe_unconfigured
tag @s remove ms_safe_keep_open
tag @s add ms_safe_configured

# minecraft:lock — ItemStack predicate. Структура собирается целиком в storage,
# после чего атомарно записывается в block entity без изменения глубокого пути.
#
# items указывает на тег #mosseater:safe_keys (echo_shard + legacy
# tripwire_hook), поэтому ванильный замок принимает и новые, и старые ключи,
# а уже установленные сейфы не требуют переустановки пароля.
execute align xyz run data merge block ~ ~ ~ {Lock:"SAFE_LOCKED"}
