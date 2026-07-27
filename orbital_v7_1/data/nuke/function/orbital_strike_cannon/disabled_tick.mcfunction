# ЗАДАЧА 1 — КОМПЛЕКС ВЫКЛЮЧЕН (#orbital_enabled nuke.config = 0).
# Вызывается из nuke:tick только при выключенном тумблере.

# 1) Рецепты крафтов орбиталок снимаются у всех игроков.
recipe take @a nuke:stabshot
recipe take @a nuke:withershot
recipe take @a nuke:fireshot

# 2) В выживании/приключении пушка ломается прямо в руках.
#    В креативе пушку можно держать и стрелять.
execute as @a[gamemode=!creative] at @s run function nuke:orbital_strike_cannon/break_cannon
