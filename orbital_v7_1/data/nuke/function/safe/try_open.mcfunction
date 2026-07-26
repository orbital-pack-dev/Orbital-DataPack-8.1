execute if items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_active:true}] run function nuke:safe/verify_key_macro with entity @s data
execute unless items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_active:true}] run title @p actionbar {"text":"Нужен Ключ для открытия!","color":"red"}
execute unless items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_active:true}] run playsound minecraft:block.chest.locked master @p ~ ~ ~ 1 1
