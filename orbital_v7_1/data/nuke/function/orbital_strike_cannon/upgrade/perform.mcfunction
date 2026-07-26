clear @s blaze_rod 1
clear @s ghast_tear 1
clear @s spectral_arrow 1
clear @s tnt 8
clear @s tnt_minecart 1
clear @s blaze_powder 4
clear @s nether_star 1

item replace entity @s weapon.offhand with fishing_rod[custom_data={nukeshot:1b,nukeshot_power:1,power_level:1,nukeshot_p1:1b,power_tag:"power_1"},custom_model_data={floats:[1001f]},custom_name={"italic":false,"color":"red","text":"NukeShot | Power-1"},rarity="rare",damage=63]

particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0 100 force
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 1 force
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.5 1.5

scoreboard players reset @s up_msg
