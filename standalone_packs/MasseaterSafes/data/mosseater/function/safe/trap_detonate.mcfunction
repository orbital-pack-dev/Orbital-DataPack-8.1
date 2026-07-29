# Контекст: as/at marker сломанной половины.
# Предохранитель ставится до любых побочных эффектов.
execute if entity @s[tag=ms_safe_exploding] run return 0
tag @s add ms_safe_exploding
playsound minecraft:entity.tnt.primed master @a[distance=..32] ~ ~ ~ 1.0 0.7

# Смерть и локализованное death message создаёт движок только при гибели.
damage @a[distance=..4] 1000 minecraft:explosion

# В double chest блокируем marker второй половины до её следующего tick.
execute if entity @s[tag=ms_safe_partner_x_pos] positioned ~1 ~ ~ run function mosseater:safe/trap_detonate_partner
execute if entity @s[tag=ms_safe_partner_x_neg] positioned ~-1 ~ ~ run function mosseater:safe/trap_detonate_partner
execute if entity @s[tag=ms_safe_partner_z_pos] positioned ~ ~ ~1 run function mosseater:safe/trap_detonate_partner
execute if entity @s[tag=ms_safe_partner_z_neg] positioned ~ ~ ~-1 run function mosseater:safe/trap_detonate_partner

kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:tnt ~ ~ ~ {fuse:0,explosion_power:4.0f}
kill @s
