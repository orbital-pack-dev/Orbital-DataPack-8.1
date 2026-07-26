import json
import os

def update_json_recipe(filepath, item_id, components):
    if not os.path.exists(filepath): 
        print(f"Missing {filepath}")
        return
    with open(filepath, "r", encoding="utf-8") as f:
        data = json.load(f)
    if "result" in data:
        data["result"]["id"] = item_id
        data["result"]["components"] = components
    with open(filepath, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"Updated {filepath}")

update_json_recipe("data/nuke/recipe/explosion_chestplaate.json", "minecraft:chainmail_chestplate", {
    "minecraft:custom_data": {"blast_vest": 1},
    "minecraft:custom_name": '{"color":"red","bold":true,"text":"💥 Подрывной Жилет","italic":false}',
    "minecraft:enchantments": {"minecraft:blast_protection": 4, "minecraft:protection": 4}
})

update_json_recipe("data/nuke/recipe/light_tnt.json", "minecraft:wind_charge", {
    "minecraft:custom_data": {"light_tnt": 1},
    "minecraft:custom_name": '{"color":"yellow","bold":true,"text":"💣 Лёгкий ТНТ","italic":false}',
    "minecraft:lore": ['{"text":"Метательный мини-заряд ТНТ с вращением","color":"gray","italic":false}']
})

for i in range(1, 5):
    update_json_recipe(f"data/nuke/recipe/timer_tnt_{i}.json", "minecraft:tnt_minecart", {
        "minecraft:custom_data": {"timer_tnt": i},
        "minecraft:custom_name": '{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ (' + str(i) + ' ч.)","italic":false}'
    })

update_json_recipe("data/nuke/recipe/fireshot.json", "minecraft:fishing_rod", {
    "minecraft:custom_data": {"nukeshot": 1},
    "minecraft:custom_name": '{"text":"Орбитальный Мушкет (Ядерный)","color":"red","bold":true,"italic":false}'
})

update_json_recipe("data/nuke/recipe/stabshot.json", "minecraft:fishing_rod", {
    "minecraft:custom_data": {"stabshot": 1},
    "minecraft:custom_name": '{"text":"Орбитальный Мушкет (Кинетический)","color":"gray","bold":true,"italic":false}'
})

update_json_recipe("data/nuke/recipe/withershot.json", "minecraft:fishing_rod", {
    "minecraft:custom_data": {"withershot": 1},
    "minecraft:custom_name": '{"text":"Орбитальный Мушкет (Визер)","color":"dark_gray","bold":true,"italic":false}'
})

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

print("All recipes updated!")
