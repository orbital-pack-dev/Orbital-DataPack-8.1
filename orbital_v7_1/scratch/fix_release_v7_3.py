import os
import json

base_path = r"c:\Users\1\AppData\Roaming\ModrinthApp\profiles\Cozy Modpack by remkkic\saves\Nuke-проверка\datapacks\orbital_v7_1\data\nuke"

# ── 1. Clean Give Chests & Shulkers (Using item_name to prevent raw JSON tooltips) ──
give_dir = os.path.join(base_path, "function", "give")
os.makedirs(give_dir, exist_ok=True)

# chest.mcfunction (All weapons directly in a chest)
chest_cmd = """give @s chest[minecraft:item_name='{"color":"gold","bold":true,"text":"📦 Арсенал (Оружия)"}',minecraft:lore=['{"text":"Орбитальный Арсенал — комплект оружия","color":"gold"}','{"text":"Внутри: готовые к бою пушки и щит","color":"gray"}'],minecraft:container=[
  {slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{stabshot:1b},"minecraft:item_name":'{"color":"aqua","bold":true,"text":"Stab-Shot"}',"minecraft:rarity":"rare","minecraft:damage":63}}},
  {slot:1,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{withershot:1b},"minecraft:item_name":'{"color":"dark_purple","bold":true,"text":"Wither-Shot"}',"minecraft:rarity":"epic","minecraft:damage":63}}},
  {slot:2,item:{id:"minecraft:crossbow",count:1,components:{"minecraft:custom_data":{orbital_mortar_bow:1b,fireshot:1b},"minecraft:item_name":'{"color":"gold","bold":true,"text":"Орбитальный Миномёт"}'}}},
  {slot:3,item:{id:"minecraft:firework_rocket",count:64,components:{"minecraft:custom_data":{orbital_rocket:1b},"minecraft:item_name":'{"color":"red","text":"Орбитальный Снаряд"}'}}},
  {slot:4,item:{id:"minecraft:shield",count:1,components:{"minecraft:custom_data":{archi_shield:1b},"minecraft:max_damage":1680,"minecraft:item_name":'{"color":"yellow","bold":true,"text":"Архи-Щит"}'}}},
  {slot:5,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:1,power_level:1,nukeshot_p1:1b,power_tag:"power_1"},"minecraft:custom_model_data":{floats:[1001.0]},"minecraft:item_name":'{"color":"red","text":"NukeShot | Power-1"}',"minecraft:rarity":"rare","minecraft:damage":63}}},
  {slot:6,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:2,power_level:2,nukeshot_p2:1b,power_tag:"power_2"},"minecraft:custom_model_data":{floats:[1002.0]},"minecraft:item_name":'{"color":"red","text":"NukeShot | Power-2"}',"minecraft:rarity":"rare","minecraft:damage":63}}},
  {slot:7,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:3,power_level:3,nukeshot_p3:1b,power_tag:"power_3"},"minecraft:custom_model_data":{floats:[1003.0]},"minecraft:item_name":'{"color":"dark_red","text":"NukeShot | Power-3"}',"minecraft:rarity":"epic","minecraft:damage":63}}},
  {slot:8,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:4,power_level:4,nukeshot_p4:1b,power_tag:"power_4"},"minecraft:custom_model_data":{floats:[1004.0]},"minecraft:item_name":'{"color":"dark_red","text":"NukeShot | Power-4"}',"minecraft:rarity":"epic","minecraft:damage":63}}}
]]"""

with open(os.path.join(give_dir, "chest.mcfunction"), "w", encoding="utf-8") as f:
    f.write(chest_cmd.replace("\n", "").replace("  ", "") + "\n")

# chest_of_shulkers.mcfunction (Chest with 8 clean shulker boxes using item_name)
chest_shulkers_cmd = """give @s chest[minecraft:item_name='{"color":"gold","bold":true,"text":"📦 Арсенал (Шалкеры)"}',minecraft:lore=['{"text":"Орбитальный Арсенал — снаряжение и ресурсы","color":"gold"}','{"text":"Внутри: 8 цветных шалкеров со всеми патронами","color":"gray"}'],minecraft:container=[
  {slot:0,item:{id:"minecraft:yellow_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"yellow","bold":true,"text":"Ресурсы | Stab-Shot"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{stabshot:1b},"minecraft:item_name":'{"color":"aqua","bold":true,"text":"Stab-Shot"}',"minecraft:rarity":"rare","minecraft:damage":63}}},
    {slot:1,item:{id:"minecraft:blaze_rod",count:64}},
    {slot:2,item:{id:"minecraft:ghast_tear",count:64}},
    {slot:3,item:{id:"minecraft:tnt",count:64}},
    {slot:4,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:5,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:6,item:{id:"minecraft:blaze_powder",count:64}},
    {slot:7,item:{id:"minecraft:nether_star",count:16}},
    {slot:8,item:{id:"minecraft:spectral_arrow",count:64}}
  ]}}},
  {slot:1,item:{id:"minecraft:purple_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"dark_purple","bold":true,"text":"Ресурсы | Wither-Shot"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{withershot:1b},"minecraft:item_name":'{"color":"dark_purple","bold":true,"text":"Wither-Shot"}',"minecraft:rarity":"epic","minecraft:damage":63}}},
    {slot:1,item:{id:"minecraft:wither_skeleton_skull",count:64}},
    {slot:2,item:{id:"minecraft:tnt",count:64}},
    {slot:3,item:{id:"minecraft:obsidian",count:64}}
  ]}}},
  {slot:2,item:{id:"minecraft:orange_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"gold","bold":true,"text":"Ресурсы | Миномёт"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:crossbow",count:1,components:{"minecraft:custom_data":{orbital_mortar_bow:1b,fireshot:1b},"minecraft:item_name":'{"color":"gold","bold":true,"text":"Орбитальный Миномёт"}'}}},
    {slot:1,item:{id:"minecraft:firework_rocket",count:64,components:{"minecraft:custom_data":{orbital_rocket:1b},"minecraft:item_name":'{"color":"red","text":"Орбитальный Снаряд"}'}}},
    {slot:2,item:{id:"minecraft:tnt",count:64}},
    {slot:3,item:{id:"minecraft:blaze_powder",count:64}}
  ]}}},
  {slot:3,item:{id:"minecraft:blue_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"blue","bold":true,"text":"Ресурсы | Архи-Щит"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:shield",count:1,components:{"minecraft:custom_data":{archi_shield:1b},"minecraft:max_damage":1680,"minecraft:item_name":'{"color":"yellow","bold":true,"text":"Архи-Щит"}'}}},
    {slot:1,item:{id:"minecraft:obsidian",count:64}},
    {slot:2,item:{id:"minecraft:netherite_ingot",count:16}}
  ]}}},
  {slot:4,item:{id:"minecraft:red_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"red","bold":true,"text":"Ресурсы | Nuke P1"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:1,power_level:1,nukeshot_p1:1b,power_tag:"power_1"},"minecraft:custom_model_data":{floats:[1001.0]},"minecraft:item_name":'{"color":"red","text":"NukeShot | Power-1"}',"minecraft:rarity":"rare","minecraft:damage":63}}},
    {slot:1,item:{id:"minecraft:netherite_block",count:1}},
    {slot:2,item:{id:"minecraft:nether_star",count:1}},
    {slot:3,item:{id:"minecraft:end_crystal",count:4}},
    {slot:4,item:{id:"minecraft:wither_skeleton_skull",count:3}},
    {slot:5,item:{id:"minecraft:tnt",count:64}}
  ]}}},
  {slot:5,item:{id:"minecraft:magenta_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"light_purple","bold":true,"text":"Ресурсы | Nuke P2"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:2,power_level:2,nukeshot_p2:1b,power_tag:"power_2"},"minecraft:custom_model_data":{floats:[1002.0]},"minecraft:item_name":'{"color":"red","text":"NukeShot | Power-2"}',"minecraft:rarity":"rare","minecraft:damage":63}}},
    {slot:1,item:{id:"minecraft:netherite_block",count:3}},
    {slot:2,item:{id:"minecraft:nether_star",count:2}},
    {slot:3,item:{id:"minecraft:end_crystal",count:8}},
    {slot:4,item:{id:"minecraft:wither_skeleton_skull",count:6}},
    {slot:5,item:{id:"minecraft:ghast_tear",count:16}},
    {slot:6,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:7,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:8,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:9,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:10,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:11,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:12,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:13,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:14,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:15,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:16,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:17,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:18,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:19,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:20,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:21,item:{id:"minecraft:tnt_minecart",count:1}}
  ]}}},
  {slot:6,item:{id:"minecraft:pink_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"dark_red","bold":true,"text":"Ресурсы | Nuke P3"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:3,power_level:3,nukeshot_p3:1b,power_tag:"power_3"},"minecraft:custom_model_data":{floats:[1003.0]},"minecraft:item_name":'{"color":"dark_red","text":"NukeShot | Power-3"}',"minecraft:rarity":"epic","minecraft:damage":63}}},
    {slot:1,item:{id:"minecraft:netherite_block",count:6}},
    {slot:2,item:{id:"minecraft:nether_star",count:4}},
    {slot:3,item:{id:"minecraft:end_crystal",count:16}},
    {slot:4,item:{id:"minecraft:beacon",count:1}},
    {slot:5,item:{id:"minecraft:dragon_breath",count:4}},
    {slot:6,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:7,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:8,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:9,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:10,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:11,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:12,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:13,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:14,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:15,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:16,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:17,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:18,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:19,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:20,item:{id:"minecraft:tnt_minecart",count:1}},
    {slot:21,item:{id:"minecraft:tnt_minecart",count:1}}
  ]}}},
  {slot:7,item:{id:"minecraft:cyan_shulker_box",count:1,components:{"minecraft:item_name":'{"color":"dark_red","bold":true,"text":"Ресурсы | Nuke P4"}',"minecraft:container":[
    {slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{nukeshot:1b,nukeshot_power:4,power_level:4,nukeshot_p4:1b,power_tag:"power_4"},"minecraft:custom_model_data":{floats:[1004.0]},"minecraft:item_name":'{"color":"dark_red","text":"NukeShot | Power-4"}',"minecraft:rarity":"epic","minecraft:damage":63}}},
    {slot:1,item:{id:"minecraft:netherite_block",count:64}},
    {slot:2,item:{id:"minecraft:nether_star",count:64}},
    {slot:3,item:{id:"minecraft:end_crystal",count:64}},
    {slot:4,item:{id:"minecraft:beacon",count:64}}
  ]}}}
]]"""

with open(os.path.join(give_dir, "chest_of_shulkers.mcfunction"), "w", encoding="utf-8") as f:
    f.write(chest_shulkers_cmd.replace("\n", "").replace("  ", "") + "\n")

print("Cleaned give chests with exact item_name components to eliminate raw JSON tooltips.")

# ── 2. Fix Dialog Menus Schema (Remove 'inputs', 'pause', 'after_action' causing [⚠️] warning) ──
dialog_dir = os.path.join(base_path, "dialog")

main_dialog = {
  "type": "minecraft:multi_action",
  "title": { "text": "🛰️ ORBITAL RAILGUN | НАСТРОЙКИ", "color": "#ff5555", "bold": True },
  "body": {
    "type": "minecraft:plain_message",
    "contents": { "text": "Выберите параметр для регулировки перезарядки (КД) и затрат опыта (XP):", "color": "gray" }
  },
  "columns": 2,
  "can_close_with_escape": True,
  "actions": [
    { "label": { "text": "⏱️ КД Stab-Shot", "color": "#55ffff" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:stab_cd" } },
    { "label": { "text": "💎 XP Stab-Shot", "color": "#55ffff" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:xp_stab" } },
    
    { "label": { "text": "⏱️ КД NukeShot", "color": "#ff5555" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:nuke_cd" } },
    { "label": { "text": "💎 XP NukeShot", "color": "#ff5555" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:xp_nuke" } },
    
    { "label": { "text": "⏱️ КД Wither-Shot", "color": "#aa00aa" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:wither_cd" } },
    { "label": { "text": "💎 XP Wither-Shot", "color": "#aa00aa" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:xp_wither" } },
    
    { "label": { "text": "⏱️ КД Миномёт", "color": "#ffaa00" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:mortar_cd" } },
    { "label": { "text": "💎 XP Миномёт", "color": "#ffaa00" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:xp_mortar" } },
    
    { "label": { "text": "⏱️ КД Архи-Щит", "color": "#ffff55" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:archi_cd" } },
    { "label": { "text": "💎 XP Архи-Щит", "color": "#ffff55" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:xp_archi" } },
    
    { "label": { "text": "👑 VIP режим (Без XP)", "color": "#55ff55" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:vip" } },
    { "label": { "text": "💀 Черепа Визера (Nuke)", "color": "#55ff55" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:wither" } },
    
    { "label": { "text": "⚔️ orbital_nerf (Урон)", "color": "#55ff55" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:orbital_nerf" } },
    { "label": { "text": "🛡️ block_protection", "color": "#55ff55" }, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:block_protection" } },
    
    { "label": { "text": "👤 Личные КД (personal_cd)", "color": "#55ff55" }, "width": 302, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:personal_cd" } },
    { "label": { "text": "📊 ПОКАЗАТЬ ВСЕ ТЕКУЩИЕ ЗНАЧЕНИЯ", "color": "#ffff55" }, "width": 302, "action": { "type": "minecraft:run_command", "command": "/trigger t_info set 1" } },
    { "label": { "text": "🔄 СБРОСИТЬ ВСЁ К СТАНДАРТУ", "color": "#ff0000" }, "width": 302, "action": { "type": "minecraft:run_command", "command": "/trigger t_reset set 1" } }
  ]
}

with open(os.path.join(dialog_dir, "main.json"), "w", encoding="utf-8") as f:
    json.dump(main_dialog, f, indent=2, ensure_ascii=False)

# Sub-dialog templates without non-schema fields
cd_data = [
    ("stab_cd", "t_stab_cd", "Stab-Shot", "200 тиков (10 сек)", "0–1200"),
    ("nuke_cd", "t_nuke_cd", "NukeShot", "600 тиков (30 сек)", "0–2400"),
    ("wither_cd", "t_wither_cd", "Wither-Shot", "400 тиков (20 сек)", "0–2400"),
    ("mortar_cd", "t_mortar_cd", "Орбитальный Миномёт", "300 тиков (15 сек)", "0–2400"),
    ("archi_cd", "t_archi_cd", "Архи-Щит", "100 тиков (5 сек)", "0–1200")
]

for name, trig, title, def_val, rng in cd_data:
    sub = {
      "type": "minecraft:multi_action",
      "title": { "text": f"⏱️ Перезарядка (КД) | {title}", "color": "#ffaa00", "bold": True },
      "body": {
        "type": "minecraft:plain_message",
        "contents": { "text": f"20 тиков = 1 секунда.\nСтандарт: {def_val}. Диапазон: {rng}.", "color": "gray" }
      },
      "columns": 4,
      "can_close_with_escape": True,
      "actions": [
        { "label": { "text": "-100" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set -100" } },
        { "label": { "text": "-20" },  "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set -20" } },
        { "label": { "text": "+20" },  "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set 20" } },
        { "label": { "text": "+100" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set 100" } },
        { "label": { "text": "📊 Показать значение", "color": "#55ff55" }, "width": 302, "action": { "type": "minecraft:run_command", "command": "/trigger t_info set 1" } },
        { "label": { "text": "⬅️ Назад в Главное Меню", "color": "#ffff55" }, "width": 302, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:main" } }
      ]
    }
    with open(os.path.join(dialog_dir, f"{name}.json"), "w", encoding="utf-8") as f:
        json.dump(sub, f, indent=2, ensure_ascii=False)

xp_data = [
    ("xp_stab", "t_xp_stab", "Stab-Shot", "1 ур.", "0–50"),
    ("xp_nuke", "t_xp_nuke", "NukeShot", "15 ур.", "0–100"),
    ("xp_wither", "t_xp_wither", "Wither-Shot", "10 ур.", "0–100"),
    ("xp_mortar", "t_xp_mortar", "Орбитальный Миномёт", "5 ур.", "0–100"),
    ("xp_archi", "t_xp_archi", "Архи-Щит", "1 ур.", "0–50")
]

for name, trig, title, def_val, rng in xp_data:
    sub = {
      "type": "minecraft:multi_action",
      "title": { "text": f"💎 Затраты опыта (XP) | {title}", "color": "#55ffff", "bold": True },
      "body": {
        "type": "minecraft:plain_message",
        "contents": { "text": f"Списывается при выстреле/срабатывании.\nСтандарт: {def_val}. Диапазон: {rng}.", "color": "gray" }
      },
      "columns": 4,
      "can_close_with_escape": True,
      "actions": [
        { "label": { "text": "-5" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set -5" } },
        { "label": { "text": "-1" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set -1" } },
        { "label": { "text": "+1" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set 1" } },
        { "label": { "text": "+5" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set 5" } },
        { "label": { "text": "📊 Показать значение", "color": "#55ff55" }, "width": 302, "action": { "type": "minecraft:run_command", "command": "/trigger t_info set 1" } },
        { "label": { "text": "⬅️ Назад в Главное Меню", "color": "#ffff55" }, "width": 302, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:main" } }
      ]
    }
    with open(os.path.join(dialog_dir, f"{name}.json"), "w", encoding="utf-8") as f:
        json.dump(sub, f, indent=2, ensure_ascii=False)

toggle_data = [
    ("vip", "t_vip", "👑 VIP режим (без расхода XP)", "Разрешает выбранным игрокам стрелять без траты уровней."),
    ("wither", "t_wither", "💀 Требование черепов Визера (NukeShot)", "Требовать ли черепа визера в инвентаре для выстрела."),
    ("orbital_nerf", "t_orbital_nerf", "⚔️ orbital_nerf (Баланс урона)", "1 = сбалансированный урон для PvP, 0 = полный урон."),
    ("block_protection", "t_block_protection", "🛡️ Защита блоков (gamerule)", "1 = отключает разрушение блоков взрывами, 0 = разрешает."),
    ("personal_cd", "t_personal_cd", "👤 Личные перезарядки (personal_cd)", "1 = индивидуальный КД для каждого игрока, 0 = без КД.")
]

for name, trig, title, desc in toggle_data:
    sub = {
      "type": "minecraft:multi_action",
      "title": { "text": title, "color": "#55ff55", "bold": True },
      "body": {
        "type": "minecraft:plain_message",
        "contents": { "text": desc, "color": "gray" }
      },
      "columns": 2,
      "can_close_with_escape": True,
      "actions": [
        { "label": { "text": "🔴 ВЫКЛЮЧИТЬ (0)", "color": "#ff5555" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set 0" } },
        { "label": { "text": "🟢 ВКЛЮЧИТЬ (1)", "color": "#55ff55" }, "action": { "type": "minecraft:run_command", "command": f"/trigger {trig} set 1" } },
        { "label": { "text": "📊 Показать значение", "color": "#55ff55" }, "width": 302, "action": { "type": "minecraft:run_command", "command": "/trigger t_info set 1" } },
        { "label": { "text": "⬅️ Назад в Главное Меню", "color": "#ffff55" }, "width": 302, "action": { "type": "minecraft:show_dialog", "dialog": "nuke:main" } }
      ]
    }
    with open(os.path.join(dialog_dir, f"{name}.json"), "w", encoding="utf-8") as f:
        json.dump(sub, f, indent=2, ensure_ascii=False)

print("Updated all 16 dialog JSON files strictly to 1.21.11 schema without warning icons.")

# ── 3. Balance Archi-Shield Thorns Damage (Rate-limited, balanced defensive damage) ──
archi_thorns_path = os.path.join(base_path, "function", "archi_shield", "knockback_and_thorns.mcfunction")
archi_thorns_code = """# ARCHI-SHIELD: KNOCKBACK + THORNS (Rate-limited for balance)
# Runs AS target mob AT target mob's position

# Rate-limit Thorns damage: check if timer is 0
scoreboard players add @s nuke.bd_count 0
execute if score @s nuke.bd_count matches 1.. run scoreboard players remove @s nuke.bd_count 1
execute if score @s nuke.bd_count matches 0 run damage @s 2 minecraft:generic by @p[distance=..8,limit=1]
execute if score @s nuke.bd_count matches 0 run playsound minecraft:enchant.thorns.hit player @a ~ ~ ~ 1.0 1.0
execute if score @s nuke.bd_count matches 0 run scoreboard players set @s nuke.bd_count 12

particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0.05 4

# Knockback
execute as @p[distance=..8,limit=1] at @s positioned 0.0 0.0 0.0 rotated as @s run summon marker ^ ^ ^0.9 {Tags:["orb_push_vec"]}
data modify entity @s Motion set from entity @e[type=marker,tag=orb_push_vec,limit=1] Pos
kill @e[type=marker,tag=orb_push_vec]
"""
with open(archi_thorns_path, "w", encoding="utf-8") as f:
    f.write(archi_thorns_code.strip() + "\n")

print("Balanced Archi-Shield Thorns damage and rate-limited triggers.")

# ── 4. Orbital Mortar Brain & Explosion (No tp to void before kill, reliable timeline & contact detonation) ──
mortar_brain_path = os.path.join(base_path, "function", "orbital_strike_cannon", "fire_shot", "main_rocket_brain.mcfunction")
mortar_brain_code = """# ORBITAL MORTAR - MAIN ROCKET BRAIN
scoreboard players add @s orb_ticks 1

# Keep rocket alive while flying — reset Life counter every tick
data modify entity @s Life set value 0

# HOMING — smooth turning curve towards nearest valid target
execute at @s rotated as @s run summon marker ~ ~ ~ {Tags:["orb_tracker"]}
execute as @e[type=marker,tag=orb_tracker,limit=1] at @s run tp @s ^ ^ ^2.5
execute as @e[type=marker,tag=orb_tracker,limit=1] at @s facing entity @e[distance=0.1..150,type=#nuke:valid_targets,tag=!orb_owner,tag=!orb_link,tag=!orb_technical,tag=!orb_spinner,tag=!orb_spinner_vert,tag=!orbital_child,tag=!orbital_child_pro,tag=!orbital_child_vert,tag=!orbital_main,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.4
tp @s ~ ~ ~ facing entity @e[type=marker,tag=orb_tracker,limit=1]
kill @e[type=marker,tag=orb_tracker]

# FORWARD MOVEMENT — convert facing direction to Motion vector (0.35 blocks/tick = 7 m/s)
execute at @s positioned 0.0 0.0 0.0 rotated as @s run summon marker ^ ^ ^0.35 {Tags:["orb_vector"]}
data modify entity @s Motion set from entity @e[type=marker,tag=orb_vector,limit=1] Pos
kill @e[type=marker,tag=orb_vector]

# TIMELINE PHASES
execute if score @s orb_ticks matches 40 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 80 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 120 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 160 run function nuke:orbital_strike_cannon/fire_shot/spawn_child
execute if score @s orb_ticks matches 180 run function nuke:orbital_strike_cannon/fire_shot/spawn_horizontal_ring
execute if score @s orb_ticks matches 220 run function nuke:orbital_strike_cannon/fire_shot/spawn_vertical_ring
execute if score @s orb_ticks matches 260.. run function nuke:orbital_strike_cannon/fire_shot/main_explosion

# DETONATION TRIGGERS (Contact with enemy or block collision after leaving crossbow)
execute if score @s orb_ticks matches 6.. if entity @e[distance=0.1..3.0,type=#nuke:valid_targets,tag=!orb_owner,tag=!orbital_child,tag=!orbital_main] run function nuke:orbital_strike_cannon/fire_shot/main_explosion
execute if score @s orb_ticks matches 6.. if block ^ ^ ^0.6 !#minecraft:air if block ^ ^ ^0.6 !#minecraft:replaceable run function nuke:orbital_strike_cannon/fire_shot/main_explosion
"""
with open(mortar_brain_path, "w", encoding="utf-8") as f:
    f.write(mortar_brain_code.strip() + "\n")

mortar_exp_path = os.path.join(base_path, "function", "orbital_strike_cannon", "fire_shot", "main_explosion.mcfunction")
mortar_exp_code = """# ORBITAL MORTAR - MAIN EXPLOSION
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0.1 5 force
particle minecraft:large_smoke ~ ~ ~ 8 4 8 0.1 500 force
particle minecraft:flash ~ ~ ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 6.0 1.0
playsound minecraft:entity.dragon_fireball.explode master @a ~ ~ ~ 6.0 0.8

execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 80 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 80 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 80 minecraft:fireworks

execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 40 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 40 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..20.0,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 40 minecraft:fireworks

tag @s remove orbital_main
kill @s
"""
with open(mortar_exp_path, "w", encoding="utf-8") as f:
    f.write(mortar_exp_code.strip() + "\n")

child_det_path = os.path.join(base_path, "function", "orbital_strike_cannon", "fire_shot", "child_detonate.mcfunction")
child_det_code = """# ORBITAL MORTAR - CHILD DETONATION ON IMPACT
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 25 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 25 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches ..0 as @e[distance=..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 25 minecraft:fireworks

execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] if entity @p[tag=orb_owner] run damage @s 12 minecraft:fireworks by @p[tag=orb_owner,limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=0.1..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p[tag=orb_owner] if entity @p run damage @s 12 minecraft:fireworks by @p[limit=1]
execute if score orbital_nerf nuke.settings matches 1.. as @e[distance=..3.5,type=!#nuke:technical,tag=!orb_owner] unless entity @p run damage @s 12 minecraft:fireworks

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1
playsound minecraft:entity.firework_rocket.blast host @a ~ ~ ~ 2.0 1.0
tag @s remove orbital_child
kill @s
"""
with open(child_det_path, "w", encoding="utf-8") as f:
    f.write(child_det_code.strip() + "\n")

print("Fixed Mortar rocket explosion and immediate despawn.")
