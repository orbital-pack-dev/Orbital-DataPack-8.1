"""Генератор рецептов Orbital DataPack 8.1 (Minecraft Java 1.21.11).

КРИТИЧЕСКОЕ ИСПРАВЛЕНИЕ:
Старая версия писала custom_name как СТРОКУ с JSON внутри:
    "minecraft:custom_name": '{"color":"red","text":"..."}'
В 1.21.5+ компоненты custom_name / item_name / lore — это текстовые компоненты
(объекты), а не строки с JSON. Из-за этого имена предметов отображались в игре
сырым JSON-кодом. Теперь генерируются настоящие объекты.

Второе исправление: флаги custom_data приводятся к целому числу 1, потому что
тик-детект датапака сравнивает с int 1, а byte 1b с ним НЕ совпадает.

Запускать из каталога orbital_v7_1/.
"""

import json
import os

RECIPE_DIR = os.path.join("data", "nuke", "recipe")


def text(value, color=None, bold=False):
    """Возвращает валидный текстовый компонент 1.21.11."""
    component = {"text": value, "italic": False}
    if color:
        component["color"] = color
    if bold:
        component["bold"] = True
    return component


def lore(*lines):
    return [text(line, "gray") for line in lines]


def update_json_recipe(filename, item_id, components, count=1):
    path = os.path.join(RECIPE_DIR, filename)
    if not os.path.exists(path):
        print(f"[skip] нет файла: {path}")
        return
    with open(path, "r", encoding="utf-8") as handle:
        data = json.load(handle)
    if "result" not in data:
        print(f"[skip] нет секции result: {path}")
        return
    data["result"]["id"] = item_id
    data["result"]["count"] = count
    data["result"]["components"] = components
    with open(path, "w", encoding="utf-8") as handle:
        json.dump(data, handle, indent=2, ensure_ascii=False)
        handle.write("\n")
    print(f"[ok] {path}")


update_json_recipe(
    "explosion_chestplaate.json",
    "minecraft:chainmail_chestplate",
    {
        "minecraft:custom_data": {"blast_vest": 1},
        "minecraft:custom_name": text("Подрывной Жилет", "red", bold=True),
        "minecraft:lore": lore("Активируется при надевании. Обратного пути нет."),
        "minecraft:enchantments": {
            "minecraft:blast_protection": 4,
            "minecraft:protection": 4,
        },
    },
)

update_json_recipe(
    "light_tnt.json",
    "minecraft:wind_charge",
    {
        "minecraft:custom_data": {"light_tnt": 1},
        "minecraft:custom_name": text("Лёгкий ТНТ", "yellow", bold=True),
        "minecraft:lore": lore("Метательный мини-заряд ТНТ с вращением"),
    },
    count=4,
)

for level in range(1, 5):
    update_json_recipe(
        f"timer_tnt_{level}.json",
        "minecraft:tnt_minecart",
        {
            "minecraft:custom_data": {"timer_tnt": level},
            "minecraft:custom_name": text(
                f"Таймер-ТНТ ({level} ч.)", "red", bold=True
            ),
            "minecraft:lore": lore("Положите на твёрдую опору, чтобы взвести"),
        },
    )

update_json_recipe(
    "fireshot.json",
    "minecraft:crossbow",
    {
        "minecraft:custom_data": {"orbital_mortar_bow": 1},
        "minecraft:custom_name": text("Орбитальный Миномет", "gold", bold=True),
        "minecraft:max_damage": 1,
        "minecraft:damage": 0,
        "minecraft:charged_projectiles": [
            {
                "id": "minecraft:firework_rocket",
                "count": 1,
                "components": {
                    "minecraft:custom_data": {"orbital_rocket": 1},
                    "minecraft:fireworks": {"flight_duration": 3},
                },
            }
        ],
    },
)

update_json_recipe(
    "stabshot.json",
    "minecraft:fishing_rod",
    {
        "minecraft:custom_data": {"stabshot": 1},
        "minecraft:custom_name": text("Stab-Shot", "aqua", bold=True),
        "minecraft:rarity": "rare",
        "minecraft:damage": 63,
    },
)

update_json_recipe(
    "withershot.json",
    "minecraft:fishing_rod",
    {
        "minecraft:custom_data": {"withershot": 1},
        "minecraft:custom_name": text("Wither-Shot", "dark_purple", bold=True),
        "minecraft:rarity": "epic",
        "minecraft:damage": 63,
    },
)

update_json_recipe(
    "archishield.json",
    "minecraft:shield",
    {
        "minecraft:custom_data": {"archi_shield": 1},
        "minecraft:custom_name": text("Архи-Щит", "gold", bold=True),
        "minecraft:lore": lore("Шифт — барьер из энергии и отброс"),
        "minecraft:rarity": "epic",
        "minecraft:max_damage": 1680,
        "minecraft:damage": 0,
    },
)

# Зелье Сытости: Сытость 3600 тиков, Регенерация 240 тиков (строго по ТЗ).
POTION_COMPONENTS = {
    "minecraft:custom_data": {"potion_of_saturation": 1},
    "minecraft:custom_name": text("Зелье Сытости", "gold", bold=True),
    "minecraft:lore": lore("Сытость — 3 минуты", "Регенерация — 12 секунд"),
    "minecraft:potion_contents": {
        "potion": "minecraft:water",
        "custom_color": 16755200,
        "custom_effects": [
            {
                "id": "minecraft:saturation",
                "amplifier": 0,
                "duration": 3600,
                "show_particles": True,
            },
            {
                "id": "minecraft:regeneration",
                "amplifier": 0,
                "duration": 240,
                "show_particles": True,
            },
        ],
    },
}

update_json_recipe("potion.json", "minecraft:potion", POTION_COMPONENTS)
update_json_recipe(
    "potion_of_saturation.json", "minecraft:potion", POTION_COMPONENTS
)

update_json_recipe(
    "safe_chest.json",
    "minecraft:chest",
    {
        "minecraft:custom_data": {"safe_box": True},
        "minecraft:item_name": text("Сундук с Паролем", "gold", bold=True),
        "minecraft:lore": lore("Поставьте, чтобы установить пароль"),
    },
)

print("Все рецепты обновлены под 1.21.11.")
