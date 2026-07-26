# Check if player holds a blank key
execute if items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_blank:true}] run function nuke:safe/set_password_success
execute unless items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_blank:true}] run title @p actionbar {"text":"Возьмите переименованную Болванку Ключа в руку!","color":"red"}
