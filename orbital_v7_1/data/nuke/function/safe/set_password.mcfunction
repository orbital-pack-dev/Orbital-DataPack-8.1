# Контекст: as <маркер interaction сейфа>, at <блок сундука>.
# Инициатор берётся по тегу safe_user, а не через @p.

execute unless entity @a[tag=safe_user,limit=1] run return fail

# 1) В руке должна быть именно наша болванка ключа.
execute unless items entity @a[tag=safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_data~{nuke_key_blank:true}] run title @a[tag=safe_user,limit=1] actionbar {"text":"Возьмите Болванку Ключа в руку!","color":"red"}
execute unless items entity @a[tag=safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_data~{nuke_key_blank:true}] run return fail

# 2) Болванка обязана быть переименована. Без этой проверки создавался сейф
#    с пустым паролем, который открывался любой неименованной болванкой.
execute unless data entity @a[tag=safe_user,limit=1] SelectedItem.components."minecraft:custom_name" run title @a[tag=safe_user,limit=1] actionbar {"text":"Сначала переименуйте болванку в Наковальне!","color":"red"}
execute unless data entity @a[tag=safe_user,limit=1] SelectedItem.components."minecraft:custom_name" run return fail

function nuke:safe/set_password_success
