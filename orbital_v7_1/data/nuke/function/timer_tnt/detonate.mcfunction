# Final detonation. This function is called once when tt_timer reaches zero.
tag @p[distance=..48] add nuke_attacker
kill @e[type=minecraft:block_display,tag=tt_display,distance=..1.6]
kill @e[type=minecraft:text_display,tag=tt_text,distance=..1.6]
kill @e[type=minecraft:interaction,tag=tt_hitbox,distance=..1.6]
# ЗАДАЧА 2.3: коллизия снимается до подрыва (на случай, если слайм ещё жив).
kill @e[type=minecraft:slime,tag=timer_tnt_slime,distance=..1.6]
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
playsound minecraft:entity.generic.explode master @a[distance=..64] ~ ~ ~ 1 0.6

# ЗАДАЧА 2.4: честный взрыв с разрушением блоков, когда защита блоков ВЫКЛ.
# Раньше условие было "matches 0", а дефолт флага = 1 и обычно он не выставлен в 0,
# поэтому Таймер-ТНТ никогда не ломал блоки. Теперь — unless matches 1.
execute unless score block_protection nuke.settings matches 1 run summon minecraft:tnt ~ ~ ~ {fuse:1s,Tags:["tt_boom"]}

# При ВКЛЮЧЕННОЙ защите блоков — только урон по сущностям, без разрушений.
# При ВЫКЛЮЧЕННОЙ урон выдаёт сам взрыв ТНТ (без двойного урона).
execute if score block_protection nuke.settings matches 1 as @e[distance=..6,type=!minecraft:item,type=!minecraft:marker,type=!minecraft:block_display,type=!minecraft:text_display,type=!minecraft:item_display,type=!minecraft:interaction,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud] run function nuke:timer_tnt/hurt
tag @a remove nuke_attacker
kill @s
