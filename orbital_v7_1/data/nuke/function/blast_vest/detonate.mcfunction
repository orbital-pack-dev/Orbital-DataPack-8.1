# Подрыв жилета. Контекст: as <игрок>, at @s.
# Все частицы/звуки/взрыв — строго в координатах владельца жилета.
# ЕДИНЫЙ ВЗРЫВНОЙ ГЕЙТ: источник истины — #block_protection nuke.config.
#   0 = защита ВЫКЛ → физический взрыв ТНТ с разрушением блоков.
#   1 = защита ВКЛ → только урон по сущностям и частицы, без физического взрыва.
# Никаких криперов и других ванильных мобов-подрывников в жилете нет — только minecraft:tnt.

# На случай отсутствия синхронизации (первый тик после /reload) — берём значение из меню.
execute unless score #block_protection nuke.config matches 0.. run scoreboard players operation #block_protection nuke.config = block_protection nuke.settings

# Автор взрыва — сам владелец (для зачёта убийств и лута).
tag @s add nuke_attacker

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..48] ~ ~ ~ 1 0.9

# Защита ВКЛ — ручной урон по сущностям, блоки целы.
execute if score #block_protection nuke.config matches 1 as @e[distance=..6,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:blast_vest/hurt

# Защита ВЫКЛ — честный взрыв: центральный заряд мгновенно + четыре по краям.
# Тег bv_boom подхватывается tick_protection как страховка, если флаг переключат в тот же тик.
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:0s,Tags:["bv_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~1 ~ ~ {fuse:1s,Tags:["bv_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~-1 ~ ~ {fuse:1s,Tags:["bv_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~ ~ ~1 {fuse:1s,Tags:["bv_boom"]}
execute if score #block_protection nuke.config matches 0 run summon minecraft:tnt ~ ~ ~-1 {fuse:1s,Tags:["bv_boom"]}

# Удаляем предмет (проклятие мешает только игроку, не команде) и подчищаем все временные метки.
item replace entity @s armor.chest with minecraft:air
tag @a remove nuke_attacker
function nuke:blast_vest/reset
