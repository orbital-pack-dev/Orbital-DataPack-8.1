# custom_name выступает детерминированным shared password-id.
# custom_data использует partial predicate (~), поэтому дополнительные поля
# Bukkit/Paper в custom_data не ломают проверку активного ключа.
$execute if items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_name=$(password),minecraft:custom_data~{mosseater_key_active:true}] run return run function mosseater:safe/access_granted
function mosseater:safe/access_denied
