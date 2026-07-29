# ItemStack predicate для Minecraft 1.21.11.
# custom_name совпадает с password-id, а custom_data проверяется частично через
# predicates, поэтому сторонняя metadata не делает правильный ключ неверным.
execute unless data storage mosseater:safe key.password run return 0

data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{mosseater_key_active:1b}}}
data modify block ~ ~ ~ components."minecraft:lock".components."minecraft:custom_name" set from storage mosseater:safe key.password
