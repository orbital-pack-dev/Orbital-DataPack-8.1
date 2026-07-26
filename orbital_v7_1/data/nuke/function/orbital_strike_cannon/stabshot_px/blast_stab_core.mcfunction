particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 1 force
playsound minecraft:entity.generic.explode master @a[distance=..80] ~ ~ ~ 4 0.8
execute at @s as @e[type=area_effect_cloud,tag=stabshot_owner,distance=..1,limit=1] on owner run tag @s add stab_attacker
execute as @e[type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:tnt,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:text_display,type=!minecraft:marker,distance=..18] run function nuke:orbital_strike_cannon/stabshot_px/blast_stab_damage
tag @a[tag=stab_attacker] remove stab_attacker
