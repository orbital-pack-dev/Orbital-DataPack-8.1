# Детонация Подрывного Жилета. Контекст: as <игрок>, at @s.
scoreboard players set @s bv_active 0
scoreboard players set @s bv_timer 0

# Владелец жилета — сам носитель, идентификатор не нужен.
tag @s add bv_owner

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 2
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 2 0.8

# Урон по площади с явным указанием источника-игрока.
execute as @e[distance=..6,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:blast_vest/hurt

# Взрывы криперов на сервере отключены сторонним датапаком, поэтому
# разрушение блоков делает обычный ТНТ и только если защита блоков выключена.
execute if score block_protection nuke.settings matches 0 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["nuke_boom"]}

clear @s minecraft:chainmail_chestplate[minecraft:custom_data~{blast_vest:1}]
tag @s remove bv_owner
