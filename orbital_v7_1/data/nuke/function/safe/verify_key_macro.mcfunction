$execute if items entity @p weapon.mainhand tripwire_hook[custom_name='$(password)'] run function nuke:safe/unlock_temporarily
$execute unless items entity @p weapon.mainhand tripwire_hook[custom_name='$(password)'] run title @p actionbar {"text":"Неверный пароль ключа!","color":"dark_red"}
