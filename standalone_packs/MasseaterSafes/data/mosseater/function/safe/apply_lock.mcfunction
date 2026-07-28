# СТРОГИЙ замок сейфа. Контекст: at <блок сундука>, требуется storage mosseater:safe key.pw.
# Имя ключа копируется СТРУКТУРНО (data modify ... set from), а не подстановкой в макрос,
# поэтому компонент имени в замке байт-в-байт совпадает с компонентом имени ключа.
# Результат: чужой ключ с другим паролем сейф НЕ открывает.
execute unless data storage mosseater:safe key.pw run return 0

data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
data modify block ~ ~ ~ components."minecraft:lock".components."minecraft:custom_name" set from storage mosseater:safe key.pw
