# Ранее этот файл был мёртвым кодом: его никто не вызывал.
# Теперь он вызывается из hit_defense и списывает прочность Архи-Щита
# за каждое срабатывание защиты. Контекст: as <игрок>.
execute if items entity @s weapon.mainhand minecraft:shield[minecraft:custom_data~{archi_shield:1}] run item modify entity @s weapon.mainhand nuke:damage_shield
execute if items entity @s weapon.offhand minecraft:shield[minecraft:custom_data~{archi_shield:1}] run item modify entity @s weapon.offhand nuke:damage_shield
