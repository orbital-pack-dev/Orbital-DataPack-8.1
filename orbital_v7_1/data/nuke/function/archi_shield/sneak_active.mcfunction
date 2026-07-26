# Энергетический барьер по шифту. Контекст: as <игрок>, at @s.
scoreboard players set #four nuke.settings 4
scoreboard players operation #archi_mod nuke.settings = @s sneak_time
scoreboard players operation #archi_mod nuke.settings %= #four nuke.settings

# Стена рисуется раз в 4 тика — раньше условие ссылалось на счётчик,
# который нигде не увеличивался, поэтому стена не появлялась вообще.
execute if score #archi_mod nuke.settings matches 0 run particle minecraft:electric_spark ~ ~1 ~ 1.4 1.0 1.4 30 0.02
execute if score #archi_mod nuke.settings matches 0 run particle minecraft:enchanted_hit ~ ~1 ~ 1.2 0.9 1.2 12 0.01
execute if score #archi_mod nuke.settings matches 0 run effect give @s minecraft:resistance 1 0 true

# Пока игрок держит барьер, снаряды рядом гасятся.
kill @e[type=minecraft:arrow,distance=..2.5]
kill @e[type=minecraft:spectral_arrow,distance=..2.5]
kill @e[type=minecraft:fireball,distance=..2.5]
kill @e[type=minecraft:small_fireball,distance=..2.5]
kill @e[type=minecraft:wither_skull,distance=..2.5]
