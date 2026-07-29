# custom_name — shared password-id. custom_data проверяется как partial predicate,
# чтобы дополнительные компоненты ключа не ломали успешное совпадение.
$execute if items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_name=$(password),minecraft:custom_data~{mosseater_key_active:true}] run return run function mosseater:safe/access_granted
function mosseater:safe/access_denied
