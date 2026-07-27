# ЭФФЕКТЫ ЗДЕСЬ НЕ ВЫДАЮТСЯ — их накладывает компонент consumable.on_consume_effects самого предмета.
# Функция отвечает только за обратную связь игроку. Контекст: as <игрок>, at @s.
playsound minecraft:entity.player.burp player @s ~ ~ ~ 1 1
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.6 1.6
particle minecraft:happy_villager ~ ~1 ~ 0.4 0.6 0.4 0.02 12
title @s actionbar {"text":"Сытость восстановлена!","color":"gold","bold":true}
advancement revoke @s only nuke:consume_potion_of_saturation
