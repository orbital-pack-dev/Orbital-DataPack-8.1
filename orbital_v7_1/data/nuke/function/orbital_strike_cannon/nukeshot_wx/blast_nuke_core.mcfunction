particle minecraft:explosion_emitter ~ ~ ~ 3 3 3 0 1 force
playsound minecraft:entity.generic.explode master @a[distance=..160] ~ ~ ~ 10 0.5
execute at @s as @e[type=area_effect_cloud,tag=nukeshot_owner,distance=..1,limit=1] on owner run tag @s add nuke_attacker
execute as @e[type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:tnt,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:text_display,type=!minecraft:marker,distance=..45] run function nuke:orbital_strike_cannon/nukeshot_wx/blast_nuke_damage
tag @a[tag=nuke_attacker] remove nuke_attacker
