import json
import os

POTION = 'potion[custom_data={potion_of_saturation:1},custom_name=\'{"text":"🧪 Зелье Сытости","color":"gold","bold":true,"italic":false}\',potion_contents={potion:"minecraft:water",custom_color:16755200,custom_effects:[{id:"minecraft:regeneration",duration:240,amplifier:0,show_particles:true},{id:"minecraft:saturation",duration:3600,amplifier:1,show_particles:true}]}]'
BLAST_VEST = 'chainmail_chestplate[custom_data={blast_vest:1},custom_name=\'{"color":"red","bold":true,"text":"💥 Подрывной Жилет","italic":false}\',enchantments={"minecraft:blast_protection":4,"minecraft:protection":4}]'
LIGHT_TNT = 'wind_charge[custom_data={light_tnt:1},custom_name=\'{"color":"yellow","bold":true,"text":"💣 Лёгкий ТНТ","italic":false}\',lore=[\'{"text":"Метательный мини-заряд ТНТ с вращением","color":"gray","italic":false}\']]'
TIMER_TNT_1H = 'tnt_minecart[custom_data={timer_tnt:1},custom_name=\'{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ (1 ч.)","italic":false}\']'
SAFE_CHEST = 'chest[custom_data={safe_box:1},custom_name=\'{"text":"📦 Сундук с Паролем","color":"gold","bold":true,"italic":false}\',lore=[\'{"text":"Поставьте, чтобы установить пароль","color":"gray","italic":false}\']]'

print("Fixing item names in give commands...")

def write_func(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

write_func("data/nuke/function/give/potion_of_saturation.mcfunction", f"give @s {POTION} 1\n")
write_func("data/nuke/function/give/blast_vest.mcfunction", f"give @s {BLAST_VEST} 1\n")
write_func("data/nuke/function/give/light_tnt.mcfunction", f"give @s {LIGHT_TNT} 16\n")
write_func("data/nuke/function/give/timer_tnt.mcfunction", f"give @s {TIMER_TNT_1H} 1\ngive @s tnt_minecart[custom_data={{timer_tnt:2}},custom_name='{{\"color\":\"red\",\"bold\":true,\"text\":\"⏲️ Таймер-ТНТ (2 ч.)\",\"italic\":false}}'] 1\ngive @s tnt_minecart[custom_data={{timer_tnt:3}},custom_name='{{\"color\":\"red\",\"bold\":true,\"text\":\"⏲️ Таймер-ТНТ (3 ч.)\",\"italic\":false}}'] 1\ngive @s tnt_minecart[custom_data={{timer_tnt:4}},custom_name='{{\"color\":\"red\",\"bold\":true,\"text\":\"⏲️ Таймер-ТНТ (4 ч.)\",\"italic\":false}}'] 1\n")
write_func("data/nuke/function/give/safe_chest.mcfunction", f"give @s {SAFE_CHEST} 1\n")

# Update JSON recipes
def update_json_recipe(filepath, item_id, components):
    if not os.path.exists(filepath): return
    with open(filepath, "r", encoding="utf-8") as f:
        data = json.load(f)
    if "result" in data:
        data["result"]["id"] = item_id
        data["result"]["components"] = components
    with open(filepath, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

update_json_recipe("data/nuke/recipe/potion.json", "minecraft:potion", {
    "minecraft:custom_name": '{"text":"🧪 Зелье Сытости","color":"gold","bold":true,"italic":false}',
    "minecraft:custom_data": {"potion_of_saturation": 1},
    "minecraft:potion_contents": {
        "potion": "minecraft:water",
        "custom_color": 16755200,
        "custom_effects": [
            {"id": "minecraft:regeneration", "amplifier": 0, "duration": 240, "show_particles": True},
            {"id": "minecraft:saturation", "amplifier": 1, "duration": 3600, "show_particles": True}
        ]
    }
})

update_json_recipe("data/nuke/recipe/blast_vest.json", "minecraft:chainmail_chestplate", {
    "minecraft:custom_data": {"blast_vest": 1},
    "minecraft:custom_name": '{"color":"red","bold":true,"text":"💥 Подрывной Жилет","italic":false}',
    "minecraft:enchantments": {"minecraft:blast_protection": 4, "minecraft:protection": 4}
})

update_json_recipe("data/nuke/recipe/safe_chest.json", "minecraft:chest", {
    "minecraft:custom_data": {"safe_box": 1},
    "minecraft:custom_name": '{"text":"📦 Сундук с Паролем","color":"gold","bold":true,"italic":false}',
    "minecraft:lore": ['{"text":"Поставьте, чтобы установить пароль","color":"gray","italic":false}']
})

print("Done")
