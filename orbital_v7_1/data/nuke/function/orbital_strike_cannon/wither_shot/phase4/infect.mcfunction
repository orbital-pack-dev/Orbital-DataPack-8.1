# WITHER SHOT - PHASE 4: AREA INFECTION (Объёмное заражение по бокам и дну кратера)
# Облака эффектов расположены по периметру взрыва голов и по дну кратера, вместо тупой стопки вниз.

playsound minecraft:entity.wither.spawn master @a[distance=..96] ~ ~ ~ 2.0 0.8
playsound minecraft:entity.wither.ambient master @a[distance=..96] ~ ~ ~ 2.0 0.5

# Визуальные частицы по всему периметру кратера
particle minecraft:witch ~ ~-2 ~ 16 6 16 0.1 600 force
particle minecraft:dragon_breath ~ ~-2 ~ 16 6 16 0.05 500 force
particle minecraft:sculk_soul ~ ~-2 ~ 14 6 14 0.08 400 force
particle minecraft:large_smoke ~ ~-2 ~ 16 6 16 0.03 400 force

# Центр дна кратера
summon area_effect_cloud ~ ~-3 ~ {duration:14400,radius:10.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}

# Внутреннее кольцо (там где падали черепа d1/d2) - радиус 9 блоков по бокам
summon area_effect_cloud ~9 ~-2 ~ {duration:14400,radius:8.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~-9 ~-2 ~ {duration:14400,radius:8.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~-2 ~9 {duration:14400,radius:8.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~-2 ~-9 {duration:14400,radius:8.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}

# Внешнее кольцо (борта кратера d3) - радиус 16 блоков по бокам
summon area_effect_cloud ~16 ~-1 ~16 {duration:14400,radius:9.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~-16 ~-1 ~16 {duration:14400,radius:9.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~16 ~-1 ~-16 {duration:14400,radius:9.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~-16 ~-1 ~-16 {duration:14400,radius:9.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}

# Наложение эффектов на врагов в радиусе кратера
effect give @e[distance=..36,type=!item,type=!experience_orb,type=!block_display,type=!area_effect_cloud,type=!interaction,type=!text_display,type=!armor_stand] minecraft:wither 40 1 true
effect give @e[distance=..36,type=!item,type=!experience_orb,type=!block_display,type=!area_effect_cloud,type=!interaction,type=!text_display,type=!armor_stand] minecraft:poison 40 1 true
