# МОДУЛЬ 4 — адресный урон грифера.
# Контекст: as <игрок, разрушивший мину>.
#
# damage ... by @s явно назначает источником урона самого игрока, поэтому
# сервер засчитывает смерть как PvP от руки игрока, а не как урон окружения.
# При выключенном keepInventory это гарантирует выпадение полного инвентаря.
title @s actionbar {text:"Сундук-Мина сдетонировал!",color:"dark_red",bold:true}
playsound minecraft:entity.generic.explode master @s ~ ~ ~ 1 0.8
damage @s 1000 minecraft:player_explosion by @s
