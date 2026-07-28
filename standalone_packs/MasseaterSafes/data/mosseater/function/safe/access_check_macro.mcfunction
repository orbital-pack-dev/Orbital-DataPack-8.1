# custom_name выступает детерминированным shared password-id:
# одинаковое имя болванки -> одинаковый ключ; другое имя -> отказ.
$execute if items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_name=$(password),minecraft:custom_data={mosseater_key_active:1b}] run return run function mosseater:safe/access_granted
function mosseater:safe/access_denied
