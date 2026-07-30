# Контекст: as/at кликнутый guard interaction.
#
# БАГ 1. Прежний радиус 1.5 захватывал сундук на Y+1 и брал ЕГО пароль.
# Теперь состояние читается только у половин текущего сейфа.
function mosseater:safe/select_pair

execute if entity @e[tag=ms_safe_pair,tag=ms_safe_keep_open,limit=1,type=minecraft:marker] run return run function mosseater:safe/access_granted

data remove storage mosseater:safe key
data modify storage mosseater:safe key.password set from entity @e[tag=ms_safe_pair,tag=ms_safe_configured,sort=nearest,limit=1,type=minecraft:marker] data.safe.password
execute unless data storage mosseater:safe key.password run return run function mosseater:safe/access_denied

# 1) Тип предмета и метка активного ключа. Проверка без макросов, поэтому
#    содержимое имени здесь никак не влияет на разбор команды.
execute unless items entity @a[tag=ms_safe_user,limit=1] weapon.mainhand minecraft:tripwire_hook[minecraft:custom_data~{mosseater_key_active:true}] run return run function mosseater:safe/access_denied
execute unless data entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name" run return run function mosseater:safe/access_denied

# 2) Сравнение имени ключа с паролем сейфа на уровне NBT.
function mosseater:safe/access_check_macro

data remove storage mosseater:safe key
function mosseater:safe/clear_pair
