# Строгий ItemStack predicate для Minecraft 1.21.11.
# storage mosseater:safe key.password содержит ТОЧНЫЙ minecraft:custom_name ключа.
execute unless data storage mosseater:safe key.password run return 0

data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",components:{"minecraft:custom_data":{mosseater_key_active:1b}}}
data modify block ~ ~ ~ components."minecraft:lock".components."minecraft:custom_name" set from storage mosseater:safe key.password
