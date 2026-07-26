# Отбрасывание и шипы. Контекст: as <игрок с тегом archi_user>, at @s.
# Раньше здесь был костыль с маркером-началом координат и ручным Motion,
# который ломался при любом смещении контекста. Теперь используется ванильный
# урон minecraft:player_attack: он сам даёт отбрасывание и, что важнее,
# засчитывает убийство игроку (сервер выдаёт лут только за смерть от игрока).
execute as @e[distance=0.1..5,type=!minecraft:player,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud,type=!minecraft:armor_stand] run function nuke:archi_shield/thorns_hit
execute as @a[distance=0.1..5,tag=!archi_user] run function nuke:archi_shield/thorns_hit
