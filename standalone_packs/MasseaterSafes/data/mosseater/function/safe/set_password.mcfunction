# Контекст: as <interaction сейфа>, at <блок сундука>.
execute unless entity @a[tag=ms_safe_user,limit=1] run return fail

# 1) В руке должна быть именно наша болванка ключа.
#    Тег #mosseater:safe_keys принимает и новый echo_shard, и старые
#    болванки на tripwire_hook, выданные до миграции.
execute unless items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand #mosseater:safe_keys[minecraft:custom_data~{mosseater_key_blank:true}] run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Возьмите Болванку Ключа в руку!",color:"red"}
execute unless items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand #mosseater:safe_keys[minecraft:custom_data~{mosseater_key_blank:true}] run return fail

# 2) Болванка обязана быть переименована, иначе пароль будет пустым.
#    Наковальня в Java переименовывает любой предмет, эхо-осколок в том числе.
execute unless data entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name" run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Сначала переименуйте болванку в Наковальне!",color:"red"}
execute unless data entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name" run return fail

function mosseater:safe/set_password_success
