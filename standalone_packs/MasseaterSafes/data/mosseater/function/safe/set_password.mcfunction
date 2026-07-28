# Контекст: as <interaction сейфа>, at <блок сундука>.
execute unless entity @a[tag=ms_safe_user,limit=1] run return fail

# 1) В руке должна быть именно наша болванка ключа.
execute unless items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_data~{mosseater_key_blank:true}] run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Возьмите Болванку Ключа в руку!",color:"red"}
execute unless items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_data~{mosseater_key_blank:true}] run return fail

# 2) Болванка обязана быть переименована, иначе пароль будет пустым.
execute unless data entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name" run title @a[tag=ms_safe_user,limit=1] actionbar {text:"Сначала переименуйте болванку в Наковальне!",color:"red"}
execute unless data entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name" run return fail

function mosseater:safe/set_password_success
