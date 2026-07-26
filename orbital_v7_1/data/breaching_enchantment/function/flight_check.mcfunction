# Проверка полёта на Элитрах с зачарованием Пробивной (разделение по уровням)
execute as @a[nbt={FallFlying:1b}] if items entity @s armor.chest elytra[enchantments~[{enchantments:"breaching_enchantment:breaching",levels:1}]] at @s run function breaching_enchantment:break_1
execute as @a[nbt={FallFlying:1b}] if items entity @s armor.chest elytra[enchantments~[{enchantments:"breaching_enchantment:breaching",levels:2}]] at @s run function breaching_enchantment:break_2
execute as @a[nbt={FallFlying:1b}] if items entity @s armor.chest elytra[enchantments~[{enchantments:"breaching_enchantment:breaching",levels:{min:3}}]] at @s run function breaching_enchantment:break_3

execute as @e[distance=0.1..2.5,type=!player,type=!#nuke:technical,type=!item] at @s run damage @s 22 minecraft:fly_into_wall by @p
execute as @e[distance=0.1..2.5,type=!player,type=!#nuke:technical,type=!item] at @s run particle sonic_boom ~ ~1 ~ 1 1 1 0 1
