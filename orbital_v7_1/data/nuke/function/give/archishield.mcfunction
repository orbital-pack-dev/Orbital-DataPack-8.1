# custom_data унифицирован к int 1: тик-детект искал {archi_shield:1} (int),
# а выдавался {archi_shield:1b} (byte) — типы NBT не совпадали, щит не работал.
give @s minecraft:shield[minecraft:custom_data={archi_shield:1},minecraft:custom_name={"color":"gold","bold":true,"text":"Архи-Щит","italic":false},minecraft:lore=[{"text":"Шифт — барьер из энергии и отброс","color":"gray","italic":false}],minecraft:rarity="epic",minecraft:max_damage=1680,minecraft:damage=0] 1
