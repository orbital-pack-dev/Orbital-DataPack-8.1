# Безопасный взрыв без разрушения блоков. Контекст: as <tnt>, at @s.
function nuke:util/resolve_owner

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1
playsound minecraft:entity.generic.explode master @a[distance=..48] ~ ~ ~ 2 0.9

# Строгий селектор: раньше было @e[distance=..8,type=!item] — попадало по дисплеям и маркерам.
execute as @e[distance=..6,type=!minecraft:tnt,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:orbital_strike_cannon/safe_tnt_hurt

tag @a remove nuke_attacker
kill @s
