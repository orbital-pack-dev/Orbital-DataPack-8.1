# Подрыв жилета. Контекст: as <игрок>, at @s.
# Все частицы/звуки/взрыв — строго в координатах владельца жилета.

# Автор взрыва — сам владелец (для зачёта убийств и лута).
tag @s add nuke_attacker

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..48] ~ ~ ~ 1 0.9

execute as @e[distance=..6,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:blast_vest/hurt

execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}

# Удаляем предмет (проклятие мешает только игроку, не команде) и подчищаем все временные метки.
item replace entity @s armor.chest with minecraft:air
tag @a remove nuke_attacker
function nuke:blast_vest/reset
