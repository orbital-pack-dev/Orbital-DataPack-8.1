# ЭФФЕКТЫ ЗДЕСЬ НЕ ВЫДАЮТСЯ — их накладывает ванильный компонент potion_contents.
# Функция отвечает только за обратную связь игроку.
playsound minecraft:entity.player.burp player @s ~ ~ ~ 1 1
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.6 1.6
particle minecraft:happy_villager ~ ~1 ~ 0.4 0.6 0.4 12 0.02
title @s actionbar {"text":"Сытость восстановлена!","color":"gold","bold":true}
advancement revoke @s only nuke:consume_potion_of_saturation
