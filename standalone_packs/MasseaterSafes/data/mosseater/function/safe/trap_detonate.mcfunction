# Контекст: as/at marker сломанной половины.
execute if entity @p[distance=..6] run tellraw @a [{"selector":"@p[distance=..6]"},{"text":" был(а) подорван(а) защитной системой Сейфа-Мины","color":"red","bold":true}]
playsound minecraft:entity.tnt.primed master @a[distance=..32] ~ ~ ~ 1.0 0.7

# В double chest уничтожается вторая половина и создаётся второй заряд.
execute if entity @s[tag=ms_safe_partner_x_pos] positioned ~1 ~ ~ run function mosseater:safe/trap_detonate_partner
execute if entity @s[tag=ms_safe_partner_x_neg] positioned ~-1 ~ ~ run function mosseater:safe/trap_detonate_partner
execute if entity @s[tag=ms_safe_partner_z_pos] positioned ~ ~ ~1 run function mosseater:safe/trap_detonate_partner
execute if entity @s[tag=ms_safe_partner_z_neg] positioned ~ ~ ~-1 run function mosseater:safe/trap_detonate_partner

kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:tnt ~ ~ ~ {fuse:0,explosion_power:4.0f}
kill @s
