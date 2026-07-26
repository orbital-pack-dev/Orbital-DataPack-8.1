import os
import json
import shutil

base_nuke = r"c:\Users\1\AppData\Roaming\ModrinthApp\profiles\Cozy Modpack by remkkic\saves\Nuke-проверка\datapacks\orbital_v7_1\data\nuke"
base_pack = r"c:\Users\1\AppData\Roaming\ModrinthApp\profiles\Cozy Modpack by remkkic\saves\Nuke-проверка\datapacks\orbital_v7_1"
thunder_source = os.path.join(base_pack, "Thunder Strike Enchantment v1.0.0 [1.21-1.21.10] (1)", "data")

def ensure_dir(path):
    os.makedirs(path, exist_ok=True)

print("Starting Chaos Update (v8.0) Build Script...")

# ══════════════════════════════════════════════════════════════
# 1. ПОДРЫВНОЙ ЖИЛЕТ (Blast Vest)
# ══════════════════════════════════════════════════════════════
print("1. Building Blast Vest...")
ensure_dir(os.path.join(base_nuke, "recipe"))
ensure_dir(os.path.join(base_nuke, "function", "blast_vest"))

blast_vest_recipe = {
  "type": "minecraft:crafting_shaped",
  "pattern": [
    ".MG",
    "#C#",
    "BT."
  ],
  "key": {
    ".": "minecraft:redstone",
    "M": "minecraft:magma_cream",
    "G": "minecraft:gunpowder",
    "#": "minecraft:tnt",
    "C": "minecraft:chainmail_chestplate",
    "B": "minecraft:blaze_powder",
    "T": "minecraft:tnt_minecart"
  },
  "result": {
    "id": "minecraft:chainmail_chestplate",
    "components": {
      "minecraft:custom_data": {"blast_vest": 1},
      "minecraft:item_name": '{"color":"red","bold":true,"text":"💥 Подрывной Жилет"}',
      "minecraft:lore": [
        '{"text":"Активируется при надевании","color":"gold"}',
        '{"text":"Таймер детонации: 32 с (настраивается в меню)","color":"gray"}'
      ]
    }
  }
}
with open(os.path.join(base_nuke, "recipe", "explosion_chestplaate.json"), "w", encoding="utf-8") as f:
    json.dump(blast_vest_recipe, f, indent=2, ensure_ascii=False)

with open(os.path.join(base_nuke, "function", "give", "blast_vest.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Выдача Подрывного Жилета
give @s chainmail_chestplate[custom_data={blast_vest:1b},item_name='{"color":"red","bold":true,"text":"💥 Подрывной Жилет"}',lore=['{"text":"Активируется при надевании","color":"gold"}','{"text":"Таймер детонации: 32 с (настраивается в меню)","color":"gray"}']]
''')

with open(os.path.join(base_nuke, "function", "blast_vest", "main.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Подрывной Жилет - основной тик
execute unless score @s bv_active matches 1 run function nuke:blast_vest/init

scoreboard players remove @s[scores={bv_timer=1..}] bv_timer 1

execute if score @s bv_timer matches 1.. if score @s bv_timer matches 0 run return 0
execute if score @s bv_timer matches 1.. run function nuke:blast_vest/display
execute if score @s bv_timer matches 0 run function nuke:blast_vest/detonate
''')

with open(os.path.join(base_nuke, "function", "blast_vest", "init.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Инициализация Подрывного Жилета при надевании
scoreboard players set @s bv_active 1
scoreboard players operation @s bv_timer = nuke.cfg.bv_time nuke.settings
execute if score @s bv_timer matches ..0 run scoreboard players set @s bv_timer 640
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
tellraw @s ["",{"text":"[⚠️ БОМБА] ","color":"red","bold":true},{"text":"Подрывной Жилет активирован! Обратный отсчёт пошёл!","color":"yellow"}]
''')

with open(os.path.join(base_nuke, "function", "blast_vest", "display.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Action Bar и тикающий звук
scoreboard players operation #bv_sec nuke.settings = @s bv_timer
scoreboard players remove #bv_sec nuke.settings 1
scoreboard players operation #bv_sec nuke.settings /= #20 nuke.settings
scoreboard players add #bv_sec nuke.settings 1

execute if score @s bv_timer matches 20 run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.8
execute if score @s bv_timer matches 40 run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.8
execute if score @s bv_timer matches 60 run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.8
execute if score @s bv_timer matches 80 run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.8
execute if score @s bv_timer matches 100 run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.8
execute if score @s bv_timer matches 120 run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.8
execute if score @s bv_timer matches 140.. if score @s bv_timer matches 20 run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.5

title @s actionbar ["",{"text":"⏳ ВЗРЫВ ЖИЛЕТА ЧЕРЕЗ: ","color":"red","bold":true},{"score":{"name":"#bv_sec","objective":"nuke.settings"},"color":"yellow","bold":true},{"text":" сек.","color":"red"}]
''')

with open(os.path.join(base_nuke, "function", "blast_vest", "detonate.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Детонация Подрывного Жилета
scoreboard players set @s bv_active 0
scoreboard players set @s bv_timer -1
clear @s chainmail_chestplate[custom_data~{blast_vest:1b}]

summon creeper ~ ~ ~ {powered:1,CustomName:'{"text":"Бомба","color":"red","bold":true}'}
particle explosion_emitter ~ ~1 ~ 2 2 2 0 5
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4 1
playsound minecraft:entity.creeper.primed master @a ~ ~ ~ 4 0.5

execute if score orbital_nerf nuke.settings matches ..0 run damage @e[distance=..16,type=!player] 80 minecraft:explosion by @s
execute if score orbital_nerf nuke.settings matches 1 run damage @e[distance=..16,type=!player] 40 minecraft:explosion by @s
execute if score orbital_nerf nuke.settings matches 2.. run damage @e[distance=..16,type=!player] 20 minecraft:explosion by @s
damage @s 20 minecraft:explosion
''')

# ══════════════════════════════════════════════════════════════
# 2. ЛЁГКИЙ ТНТ (Light TNT)
# ══════════════════════════════════════════════════════════════
print("2. Building Light TNT...")
ensure_dir(os.path.join(base_nuke, "function", "light_tnt"))

light_tnt_recipe = {
  "type": "minecraft:crafting_shaped",
  "pattern": [
    "#.",
    "W "
  ],
  "key": {
    "#": "minecraft:tnt_minecart",
    ".": "minecraft:blaze_powder",
    "W": "minecraft:wind_charge"
  },
  "result": {
    "id": "minecraft:wind_charge",
    "count": 4,
    "components": {
      "minecraft:custom_data": {"light_tnt": 1},
      "minecraft:item_name": '{"color":"yellow","bold":true,"text":"💣 Лёгкий ТНТ"}',
      "minecraft:lore": [
        '{"text":"Метательный мини-заряд ТНТ с вращением","color":"gray"}'
      ]
    }
  }
}
with open(os.path.join(base_nuke, "recipe", "light_tnt.json"), "w", encoding="utf-8") as f:
    json.dump(light_tnt_recipe, f, indent=2, ensure_ascii=False)

with open(os.path.join(base_nuke, "function", "give", "light_tnt.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Выдача Лёгкого ТНТ
give @s wind_charge[custom_data={light_tnt:1b},item_name='{"color":"yellow","bold":true,"text":"💣 Лёгкий ТНТ"}',lore=['{"text":"Метательный мини-заряд ТНТ с вращением","color":"gray"}']] 16
''')

with open(os.path.join(base_nuke, "function", "light_tnt", "init.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Инициализация брошенного Лёгкого ТНТ
tag @s add lt_processed
summon block_display ~ ~ ~ {Tags:["lt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.3f,-0.3f,-0.3f],scale:[0.6f,0.6f,0.6f]}}
''')

with open(os.path.join(base_nuke, "function", "light_tnt", "tick.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Тик Лёгкого ТНТ - вращение и следование
execute as @e[type=wind_charge,tag=light_tnt] at @s run tp @e[type=block_display,tag=lt_display,distance=..3,limit=1] ~ ~ ~
execute as @e[type=block_display,tag=lt_display] at @s run tp @s ~ ~ ~ ~18 ~
execute as @e[type=block_display,tag=lt_display] at @s unless entity @e[type=wind_charge,tag=light_tnt,distance=..3] run function nuke:light_tnt/detonate
''')

with open(os.path.join(base_nuke, "function", "light_tnt", "detonate.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Детонация Лёгкого ТНТ при падении
particle explosion_emitter ~ ~ ~ 1 1 1 0 2
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 2 1.2
damage @e[distance=..5] 14 minecraft:explosion
kill @s
''')

# ══════════════════════════════════════════════════════════════
# 3. ЗЕЛЬЕ СЫТОСТИ (Potion of Saturation)
# ══════════════════════════════════════════════════════════════
print("3. Building Potion of Saturation...")
ensure_dir(os.path.join(base_nuke, "function", "potion_of_saturation"))

potion_recipe = {
  "type": "minecraft:crafting_shaped",
  "pattern": [
    " G ",
    " B ",
    "   "
  ],
  "key": {
    "G": "minecraft:golden_apple",
    "B": "minecraft:glass_bottle"
  },
  "result": {
    "id": "minecraft:potion",
    "components": {
      "minecraft:custom_data": {"potion_of_saturation": 1},
      "minecraft:item_name": '{"color":"gold","bold":true,"text":"🧪 Зелье Сытости"}',
      "minecraft:lore": [
        '{"text":"Даёт эффект Сытости на 3 минуты (180 сек)","color":"gray"}'
      ],
      "minecraft:potion_contents": {
        "custom_color": 16766720,
        "custom_effects": [
          {"id": "minecraft:saturation", "duration": 3600, "amplifier": 0},
          {"id": "minecraft:regeneration", "duration": 3600, "amplifier": 0}
        ]
      }
    }
  }
}
with open(os.path.join(base_nuke, "recipe", "potion_of_saturation.json"), "w", encoding="utf-8") as f:
    json.dump(potion_recipe, f, indent=2, ensure_ascii=False)

with open(os.path.join(base_nuke, "function", "give", "potion_of_saturation.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Выдача Зелья Сытости
give @s potion[custom_data={potion_of_saturation:1b},item_name='{"color":"gold","bold":true,"text":"🧪 Зелье Сытости"}',lore=['{"text":"Даёт эффект Сытости на 3 минуты (180 сек)","color":"gray"}'],potion_contents={custom_color:16766720,custom_effects:[{id:"minecraft:saturation",duration:3600,amplifier:0},{id:"minecraft:regeneration",duration:3600,amplifier:0}]}] 1
''')

# ══════════════════════════════════════════════════════════════
# 4. ВИЗУАЛЬНАЯ ЧАСТЬ (Visual Overhaul)
# ══════════════════════════════════════════════════════════════
print("4. Enhancing Visual Effects across weapons...")
with open(os.path.join(base_nuke, "function", "orbital_strike_cannon", "activate_shots", "stab.mcfunction"), "r", encoding="utf-8") as f:
    content = f.read()
if "electric_spark" not in content:
    content += "\n# Visual Overhaul: Stab-Shot electric trail & sparks\nparticle electric_spark ~ ~ ~ 0.3 0.3 0.3 0.08 4\nparticle end_rod ~ ~ ~ 0.2 0.2 0.2 0.03 2\n"
    with open(os.path.join(base_nuke, "function", "orbital_strike_cannon", "activate_shots", "stab.mcfunction"), "w", encoding="utf-8") as f:
        f.write(content)

with open(os.path.join(base_nuke, "function", "orbital_strike_cannon", "activate_shots", "nuke.mcfunction"), "r", encoding="utf-8") as f:
    content = f.read()
if "sonic_boom" not in content:
    content += "\n# Visual Overhaul: NukeShot power aura & blast ring\nexecute if score @s nuke.power matches 1.. at @s run particle flame ~ ~ ~ 0.6 0.6 0.6 0.05 4\nexecute if score @s nukeshot_timer matches 19 at @s run particle sonic_boom ~ ~ ~ 1 0 1 0 1\n"
    with open(os.path.join(base_nuke, "function", "orbital_strike_cannon", "activate_shots", "nuke.mcfunction"), "w", encoding="utf-8") as f:
        f.write(content)

with open(os.path.join(base_nuke, "function", "orbital_strike_cannon", "activate_shots", "wither.mcfunction"), "r", encoding="utf-8") as f:
    content = f.read()
if "soul_fire_flame" not in content:
    content += "\n# Visual Overhaul: Wither-Shot dark soul fire trails\nparticle soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.03 3\nparticle smoke ~ ~ ~ 0.3 0.3 0.3 0.02 3\n"
    with open(os.path.join(base_nuke, "function", "orbital_strike_cannon", "activate_shots", "wither.mcfunction"), "w", encoding="utf-8") as f:
        f.write(content)

with open(os.path.join(base_nuke, "function", "archi_shield", "main.mcfunction"), "r", encoding="utf-8") as f:
    content = f.read()
if "nautilus" not in content:
    content += "\n# Visual Overhaul: Archi-Shield rotating energy aura\nparticle nautilus ~ ~1 ~ 0.6 0.5 0.6 0.02 2\nparticle enchant ~ ~1 ~ 0.5 0.5 0.5 0.05 2\n"
    with open(os.path.join(base_nuke, "function", "archi_shield", "main.mcfunction"), "w", encoding="utf-8") as f:
        f.write(content)

# ══════════════════════════════════════════════════════════════
# 5. ВЗРЫВНЫЕ СЧАСТЛИВЫЕ ГАСТЫ (Happy Ghast Kamikaze)
# ══════════════════════════════════════════════════════════════
print("5. Building Happy Ghast Kamikaze...")
ensure_dir(os.path.join(base_nuke, "function", "happy_ghast"))
ensure_dir(os.path.join(base_nuke, "advancement"))
ensure_dir(os.path.join(base_nuke, "tags", "entity_type"))

ghast_interact_adv = {
  "criteria": {
    "interact": {
      "trigger": "minecraft:player_interacted_with_entity",
      "conditions": {
        "entity": {
          "type": "#nuke:ghast_types"
        }
      }
    }
  },
  "rewards": {
    "function": "nuke:happy_ghast/on_interact"
  }
}
with open(os.path.join(base_nuke, "advancement", "interact_ghast.json"), "w", encoding="utf-8") as f:
    json.dump(ghast_interact_adv, f, indent=2, ensure_ascii=False)

ghast_types_tag = {
  "values": [
    "minecraft:ghast",
    "minecraft:happy_ghast"
  ]
}
with open(os.path.join(base_nuke, "tags", "entity_type", "ghast_types.json"), "w", encoding="utf-8") as f:
    json.dump(ghast_types_tag, f, indent=2, ensure_ascii=False)

with open(os.path.join(base_nuke, "function", "happy_ghast", "on_interact.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Обработка клика по Счастливой Гасту / Гасту
advancement revoke @s only nuke:interact_ghast
execute if predicate nuke:is_sneaking if items entity @s weapon.mainhand tnt at @s run function nuke:happy_ghast/try_attach
''')

with open(os.path.join(base_nuke, "function", "happy_ghast", "try_attach.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Попытка закрепить ТНТ на Гасте
execute as @e[type=#nuke:ghast_types,distance=..6,limit=1,sort=nearest] run function nuke:happy_ghast/attach_tnt
''')

with open(os.path.join(base_nuke, "function", "happy_ghast", "attach_tnt.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Прикрепление ТНТ к Гасту/Счастливой Гасту
execute if score @s ghast_tnt matches 14.. run tellraw @p ["",{"text":"[⚠️] ","color":"yellow"},{"text":"На этом Гасте уже закреплено максимум ТНТ (14/14)!","color":"red"}]
execute if score @s ghast_tnt matches 14.. run return 0

clear @p tnt 1
scoreboard players add @s ghast_tnt 1

playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 2 1.2
particle smoke ~ ~2 ~ 0.5 0.5 0.5 0.05 15
summon block_display ~ ~1.5 ~ {Tags:["ghast_tnt_display"],block_state:{Name:"minecraft:tnt"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.4f,-0.4f,-0.4f],scale:[0.8f,0.8f,0.8f]}}

tellraw @p ["",{"text":"[💣 КАМИКАДЗЕ] ","color":"red","bold":true},{"text":"Заряд ТНТ закреплён на Гасте! Всего: ","color":"yellow"},{"score":{"name":"@s","objective":"ghast_tnt"},"color":"red","bold":true},{"text":"/14","color":"gray"}]
''')

with open(os.path.join(base_nuke, "function", "happy_ghast", "tick.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Тик Взрывных Гастов
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s run tp @e[type=block_display,tag=ghast_tnt_display,distance=..5] ~ ~2 ~
execute as @e[type=block_display,tag=ghast_tnt_display] at @s run tp @s ~ ~ ~ ~12 ~

execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~ ~ #minecraft:fire run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~1 ~ #minecraft:fire run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..}] at @s if block ~ ~ ~ minecraft:lava run function nuke:happy_ghast/detonate
execute as @e[type=#nuke:ghast_types,scores={ghast_tnt=1..},nbt={HurtTime:10s}] at @s run function nuke:happy_ghast/detonate
''')

with open(os.path.join(base_nuke, "function", "happy_ghast", "detonate.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Цепной взрыв Гаста-Камикадзе
particle explosion_emitter ~ ~1 ~ 4 4 4 0 12
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 5 0.8
playsound minecraft:entity.ghast.scream master @a ~ ~ ~ 4 1.2

execute if score @s ghast_tnt matches 1..4 run damage @e[distance=..10] 40 minecraft:explosion by @s
execute if score @s ghast_tnt matches 5..9 run damage @e[distance=..15] 80 minecraft:explosion by @s
execute if score @s ghast_tnt matches 10..14 run damage @e[distance=..22] 150 minecraft:explosion by @s

kill @e[type=block_display,tag=ghast_tnt_display,distance=..8]
kill @s
''')

# ══════════════════════════════════════════════════════════════
# 6. ЗАЧАРОВАНИЕ ГРОМОУДАР 1-3 (Thunder Strike) - Recursive copy
# ══════════════════════════════════════════════════════════════
print("6. Integrating Thunder Strike Enchantment...")
if os.path.exists(thunder_source):
    shutil.copytree(thunder_source, os.path.join(base_pack, "data"), dirs_exist_ok=True)
print("Thunder Strike integration completed.")

ensure_dir(os.path.join(base_pack, "data", "minecraft", "tags", "enchantment"))
ts_tag = {
  "values": [
    "thunder_strike_enchantment:thunder_strike",
    "nuke:breaching"
  ]
}
with open(os.path.join(base_pack, "data", "minecraft", "tags", "enchantment", "in_enchanting_table.json"), "w", encoding="utf-8") as f:
    json.dump(ts_tag, f, indent=2, ensure_ascii=False)

# ══════════════════════════════════════════════════════════════
# 7. ЗАЧАРОВАНИЕ ПРОБИВНОЙ 1 (Breaching for Elytra)
# ══════════════════════════════════════════════════════════════
print("7. Building Breaching Enchantment for Elytra...")
ensure_dir(os.path.join(base_nuke, "enchantment"))
ensure_dir(os.path.join(base_nuke, "tags", "block"))
ensure_dir(os.path.join(base_nuke, "function", "breaching"))

breaching_ench = {
  "anvil_cost": 4,
  "description": "Пробивной",
  "max_cost": {
    "base": 50,
    "per_level_above_first": 20
  },
  "max_level": 1,
  "min_cost": {
    "base": 15,
    "per_level_above_first": 20
  },
  "slots": ["armor.chest"],
  "supported_items": "#minecraft:enchantable/elytra",
  "primary_items": "#minecraft:enchantable/elytra",
  "weight": 2
}
with open(os.path.join(base_nuke, "enchantment", "breaching.json"), "w", encoding="utf-8") as f:
    json.dump(breaching_ench, f, indent=2, ensure_ascii=False)

elytra_breakable = {
  "values": [
    "minecraft:glass",
    "minecraft:white_stained_glass",
    "minecraft:tinted_glass",
    "#minecraft:leaves",
    "minecraft:ice",
    "minecraft:thin_glass",
    "minecraft:glass_pane",
    "#minecraft:fences"
  ]
}
with open(os.path.join(base_nuke, "tags", "block", "elytra_breakable.json"), "w", encoding="utf-8") as f:
    json.dump(elytra_breakable, f, indent=2, ensure_ascii=False)

with open(os.path.join(base_nuke, "function", "breaching", "flight_check.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Проверка полёта на Элитрах с зачарованием Пробивной
execute if block ~ ~ ~ #nuke:elytra_breakable run setblock ~ ~ ~ air destroy
execute if block ~ ~1 ~ #nuke:elytra_breakable run setblock ~ ~1 ~ air destroy
execute if block ~1 ~ ~ #nuke:elytra_breakable run setblock ~1 ~ ~ air destroy
execute if block ~-1 ~ ~ #nuke:elytra_breakable run setblock ~-1 ~ ~ air destroy
execute if block ~ ~ ~1 #nuke:elytra_breakable run setblock ~ ~ ~1 air destroy
execute if block ~ ~ ~-1 #nuke:elytra_breakable run setblock ~ ~ ~-1 air destroy

execute as @e[distance=..2.5,type=!player,type=!item,type=!block_display] at @s run damage @s 22 minecraft:fly_into_wall by @p
execute as @e[distance=..2.5,type=!player,type=!item,type=!block_display] at @s run particle sonic_boom ~ ~1 ~ 1 1 1 0 1
''')

# ══════════════════════════════════════════════════════════════
# 8. ТАЙМЕР-ТНТ (Timer TNT)
# ══════════════════════════════════════════════════════════════
print("8. Building Timer TNT...")
ensure_dir(os.path.join(base_nuke, "function", "timer_tnt"))

for hours in range(1, 5):
    pattern = ["#F#", "FTF" if hours == 1 else ("FTC" if hours == 2 else "CTC"), "#C#"] if hours < 4 else [".#.", "#T#", ".#."]
    key = {
      "#": "minecraft:redstone" if hours < 4 else "minecraft:clock",
      "F": "minecraft:feather",
      "T": "minecraft:tnt_minecart",
      "C": "minecraft:clock"
    } if hours < 4 else {
      ".": "minecraft:redstone",
      "#": "minecraft:clock",
      "T": "minecraft:tnt_minecart"
    }
    rec = {
      "type": "minecraft:crafting_shaped",
      "pattern": pattern,
      "key": key,
      "result": {
        "id": "minecraft:tnt_minecart",
        "components": {
          "minecraft:custom_data": {"timer_tnt": hours},
          "minecraft:item_name": f'{{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ ({hours} ч.)"}}',
          "minecraft:lore": [
            f'{{"text":"Установлено часов: {hours}","color":"yellow"}}',
            '{"text":"Масштаб времени настраивается в меню","color":"gray"}'
          ]
        }
      }
    }
    with open(os.path.join(base_nuke, "recipe", f"timer_tnt_{hours}.json"), "w", encoding="utf-8") as f:
        json.dump(rec, f, indent=2, ensure_ascii=False)

with open(os.path.join(base_nuke, "function", "give", "timer_tnt.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Выдача комплекта Таймер-ТНТ
give @s tnt_minecart[custom_data={timer_tnt:1},item_name='{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ (1 ч.)"}'] 1
give @s tnt_minecart[custom_data={timer_tnt:2},item_name='{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ (2 ч.)"}'] 1
give @s tnt_minecart[custom_data={timer_tnt:3},item_name='{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ (3 ч.)"}'] 1
give @s tnt_minecart[custom_data={timer_tnt:4},item_name='{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ (4 ч.)"}'] 1
''')

with open(os.path.join(base_nuke, "function", "timer_tnt", "init.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Инициализация установленной вагонетки Таймер-ТНТ
tag @s add tt_init
execute if data entity @s Item.components."minecraft:custom_data".timer_tnt run scoreboard players set @s tt_hours 1
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:2} run scoreboard players set @s tt_hours 2
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:3} run scoreboard players set @s tt_hours 3
execute if data entity @s Item.components."minecraft:custom_data"{timer_tnt:4} run scoreboard players set @s tt_hours 4

scoreboard players operation @s tt_timer = @s tt_hours
scoreboard players operation #scale nuke.settings = nuke.cfg.tt_scale nuke.settings
execute if score #scale nuke.settings matches ..0 run scoreboard players set #scale nuke.settings 1200
scoreboard players operation @s tt_timer *= #scale nuke.settings

playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 1.2
''')

with open(os.path.join(base_nuke, "function", "timer_tnt", "tick.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Обработка таймера вагонеток ТНТ
scoreboard players remove @e[type=tnt_minecart,tag=tt_init,scores={tt_timer=1..}] tt_timer 1
execute as @e[type=tnt_minecart,tag=tt_init,scores={tt_timer=1..60}] at @s if score @s tt_timer matches %10 == 0 run playsound minecraft:ui.button.click master @a ~ ~ ~ 2 2.0
execute as @e[type=tnt_minecart,tag=tt_init,scores={tt_timer=1..60}] at @s run particle smoke ~ ~1 ~ 0.2 0.5 0.2 0.02 2
execute as @e[type=tnt_minecart,tag=tt_init,scores={tt_timer=0}] at @s run function nuke:timer_tnt/detonate
''')

with open(os.path.join(base_nuke, "function", "timer_tnt", "detonate.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''# Детонация Таймер-ТНТ
particle explosion_emitter ~ ~0.5 ~ 3 3 3 0 8
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4 1
damage @e[distance=..12] 70 minecraft:explosion
kill @s
''')

# ══════════════════════════════════════════════════════════════
# 9. МУЛЬТИШОТ-25 МИНОМЁТ & ДИАЛОГИ & ТИКИ
# ══════════════════════════════════════════════════════════════
print("9. Upgrading Mortar & Hooking up Ticks & Dialogs...")
with open(os.path.join(base_nuke, "function", "give", "chest.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''give @s chest[minecraft:item_name='{"color":"gold","bold":true,"text":"📦 Арсенал Хаоса (v8.0)"}',minecraft:lore=['{"text":"Орбитальный Арсенал Хаоса","color":"gold"}','{"text":"Включены: Мультишот-25 Миномёт, Жилет, Лёгкий и Таймер ТНТ","color":"gray"}'],minecraft:container=[{slot:0,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{stabshot:1b},"minecraft:item_name":'{"color":"aqua","bold":true,"text":"Stab-Shot"}',"minecraft:rarity":"rare","minecraft:damage":63}}},{slot:1,item:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:custom_data":{withershot:1b},"minecraft:item_name":'{"color":"dark_purple","bold":true,"text":"Wither-Shot"}',"minecraft:rarity":"epic","minecraft:damage":63}}},{slot:2,item:{id:"minecraft:crossbow",count:1,components:{"minecraft:custom_data":{orbital_mortar_bow:1b,fireshot:1b},"minecraft:enchantments":{levels:{"minecraft:multishot":25}},"minecraft:item_name":'{"color":"gold","bold":true,"text":"🛰️ Орбитальный Миномёт | Multishot XXV"}'}}},{slot:3,item:{id:"minecraft:firework_rocket",count:64,components:{"minecraft:custom_data":{orbital_rocket:1b},"minecraft:item_name":'{"color":"red","text":"Орбитальный Снаряд"}'}}},{slot:4,item:{id:"minecraft:shield",count:1,components:{"minecraft:custom_data":{archi_shield:1b},"minecraft:max_damage":1680,"minecraft:item_name":'{"color":"yellow","bold":true,"text":"Архи-Щит"}'}}},{slot:5,item:{id:"minecraft:chainmail_chestplate",count:1,components:{"minecraft:custom_data":{blast_vest:1b},"minecraft:item_name":'{"color":"red","bold":true,"text":"💥 Подрывной Жилет"}',lore:['{"text":"Активируется при надевании (32 сек)","color":"gold"}']}}},{slot:6,item:{id:"minecraft:wind_charge",count:16,components:{"minecraft:custom_data":{light_tnt:1b},"minecraft:item_name":'{"color":"yellow","bold":true,"text":"💣 Лёгкий ТНТ"}'}}},{slot:7,item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_data":{potion_of_saturation:1b},"minecraft:item_name":'{"color":"gold","bold":true,"text":"🧪 Зелье Сытости"}',potion_contents:{custom_color:16766720,custom_effects:[{id:"minecraft:saturation",duration:3600,amplifier:0},{id:"minecraft:regeneration",duration:3600,amplifier:0}]}}}},{slot:8,item:{id:"minecraft:tnt_minecart",count:4,components:{"minecraft:custom_data":{timer_tnt:1},"minecraft:item_name":'{"color":"red","bold":true,"text":"⏲️ Таймер-ТНТ (1 ч.)"}'}}}]]
''')

with open(os.path.join(base_nuke, "function", "give", "all.mcfunction"), "w", encoding="utf-8") as f:
    f.write('''function nuke:give/archishield
function nuke:give/chest
function nuke:give/chest_of_shulkers
function nuke:give/fireshot
function nuke:give/nukeshot
function nuke:give/shulker_of_explosives
function nuke:give/stabshot
function nuke:give/withershot
function nuke:give/blast_vest
function nuke:give/light_tnt
function nuke:give/potion_of_saturation
function nuke:give/timer_tnt
''')

# Update tick.mcfunction with new ticks
with open(os.path.join(base_nuke, "function", "tick.mcfunction"), "r", encoding="utf-8") as f:
    tick_content = f.read()

hooks = """
# ═══════════════════════════════════════════════════════════
# CHAOS UPDATE v8.0 TICKS
# ═══════════════════════════════════════════════════════════
# 1) Подрывной Жилет
execute as @a if items entity @s armor.chest chainmail_chestplate[custom_data~{blast_vest:1b}] at @s run function nuke:blast_vest/main

# 2) Лёгкий ТНТ (wind_charge)
execute as @e[type=wind_charge,tag=!lt_processed,nbt={Item:{components:{"minecraft:custom_data":{light_tnt:1b}}}}] run function nuke:light_tnt/init
execute as @a if items entity @s weapon.mainhand wind_charge[custom_data~{light_tnt:1b}] run tag @e[type=wind_charge,distance=..6,tag=!lt_processed] add light_tnt
execute as @e[type=wind_charge,tag=light_tnt,tag=!lt_processed] run function nuke:light_tnt/init
function nuke:light_tnt/tick

# 3) Взрывные Счастливые Гасты (happy_ghast & ghast)
function nuke:happy_ghast/tick

# 4) Зачарование Пробивной 1 на Элитрах
execute as @a[nbt={FallFlying:1b}] if items entity @s armor.chest elytra[enchantments~[{enchantments:"nuke:breaching"}]] at @s run function nuke:breaching/flight_check

# 5) Таймер-ТНТ (tnt_minecart)
execute as @e[type=tnt_minecart,tag=!tt_init,nbt={Item:{components:{"minecraft:custom_data":{timer_tnt:1b}}}}] run function nuke:timer_tnt/init
execute as @e[type=tnt_minecart,tag=!tt_init,nbt={Item:{components:{"minecraft:custom_data":{timer_tnt:2}}}}] run function nuke:timer_tnt/init
execute as @e[type=tnt_minecart,tag=!tt_init,nbt={Item:{components:{"minecraft:custom_data":{timer_tnt:3}}}}] run function nuke:timer_tnt/init
execute as @e[type=tnt_minecart,tag=!tt_init,nbt={Item:{components:{"minecraft:custom_data":{timer_tnt:4}}}}] run function nuke:timer_tnt/init
function nuke:timer_tnt/tick
"""
if "CHAOS UPDATE v8.0 TICKS" not in tick_content:
    # insert right before function nuke:settings/process_triggers
    tick_content = tick_content.replace("function nuke:settings/process_triggers", hooks + "\nfunction nuke:settings/process_triggers")
    with open(os.path.join(base_nuke, "function", "tick.mcfunction"), "w", encoding="utf-8") as f:
        f.write(tick_content)

# Dialog buttons and settings defaults
# Add default setting values in reset.mcfunction
with open(os.path.join(base_nuke, "function", "settings", "reset.mcfunction"), "r", encoding="utf-8") as f:
    reset_content = f.read()
if "nuke.cfg.bv_time" not in reset_content:
    reset_content += "\nscoreboard players set nuke.cfg.bv_time nuke.settings 640\nscoreboard players set nuke.cfg.tt_scale nuke.settings 1200\n"
    with open(os.path.join(base_nuke, "function", "settings", "reset.mcfunction"), "w", encoding="utf-8") as f:
        f.write(reset_content)

# Enable triggers
with open(os.path.join(base_nuke, "function", "settings", "enable_triggers.mcfunction"), "r", encoding="utf-8") as f:
    trig_content = f.read()
if "t_bv_time" not in trig_content:
    trig_content += "\nscoreboard objectives add t_bv_time trigger\nscoreboard players enable @s t_bv_time\nscoreboard objectives add t_tt_scale trigger\nscoreboard players enable @s t_tt_scale\n"
    with open(os.path.join(base_nuke, "function", "settings", "enable_triggers.mcfunction"), "w", encoding="utf-8") as f:
        f.write(trig_content)

# Dialog files
ensure_dir(os.path.join(base_nuke, "dialog"))
bv_dialog = {
  "type": "minecraft:multi_action",
  "title": {"text": "⏱️ НАСТРОЙКА ПОДРЫВНОГО ЖИЛЕТА", "color": "#ff5555", "bold": True},
  "columns": 2,
  "actions": [
    {"label": {"text": "16 секунд", "color": "#ff5555"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_bv_time set 320"}},
    {"label": {"text": "32 секунды (Стандарт)", "color": "#55ff55"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_bv_time set 640"}},
    {"label": {"text": "64 секунды", "color": "#ffaa00"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_bv_time set 1280"}},
    {"label": {"text": "120 секунд (2 мин)", "color": "#ffff55"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_bv_time set 2400"}}
  ]
}
with open(os.path.join(base_nuke, "dialog", "bv_time.json"), "w", encoding="utf-8") as f:
    json.dump(bv_dialog, f, indent=2, ensure_ascii=False)

tt_dialog = {
  "type": "minecraft:multi_action",
  "title": {"text": "⏲️ МАСШТАБ ТАЙМЕР-ТНТ (за 1 час)", "color": "#ffaa00", "bold": True},
  "columns": 2,
  "actions": [
    {"label": {"text": "1 час = 1 секунда", "color": "#ff5555"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_tt_scale set 20"}},
    {"label": {"text": "1 час = 10 секунд", "color": "#ffaa00"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_tt_scale set 200"}},
    {"label": {"text": "1 час = 1 минута (Стандарт)", "color": "#55ff55"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_tt_scale set 1200"}},
    {"label": {"text": "1 час = 4 минуты", "color": "#ffff55"}, "action": {"type": "minecraft:run_command", "command": "/trigger t_tt_scale set 4800"}}
  ]
}
with open(os.path.join(base_nuke, "dialog", "tt_scale.json"), "w", encoding="utf-8") as f:
    json.dump(tt_dialog, f, indent=2, ensure_ascii=False)

# Add buttons to main.json
with open(os.path.join(base_nuke, "dialog", "main.json"), "r", encoding="utf-8") as f:
    main_dlg = json.load(f)
# check if buttons already present
if not any("Подрывной Жилет" in str(a.get("label", {})) for a in main_dlg["actions"]):
    main_dlg["actions"].insert(10, {
      "label": {"text": "💥 Подрывной Жилет (Таймер)", "color": "#ff5555"},
      "action": {"type": "minecraft:show_dialog", "dialog": "nuke:bv_time"}
    })
    main_dlg["actions"].insert(11, {
      "label": {"text": "⏲️ Масштаб Таймер-ТНТ", "color": "#ffaa00"},
      "action": {"type": "minecraft:show_dialog", "dialog": "nuke:tt_scale"}
    })
    with open(os.path.join(base_nuke, "dialog", "main.json"), "w", encoding="utf-8") as f:
        json.dump(main_dlg, f, indent=2, ensure_ascii=False)

# Add trigger processing in process_triggers.mcfunction
with open(os.path.join(base_nuke, "function", "settings", "process_triggers.mcfunction"), "r", encoding="utf-8") as f:
    proc_content = f.read()
if "t_bv_time" not in proc_content:
    extra_proc = """
execute as @a[scores={t_bv_time=1..}] run scoreboard players operation nuke.cfg.bv_time nuke.settings = @s t_bv_time
execute as @a[scores={t_bv_time=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Таймер Подрывного Жилета установлен.","color":"yellow"}]
scoreboard players reset @a t_bv_time

execute as @a[scores={t_tt_scale=1..}] run scoreboard players operation nuke.cfg.tt_scale nuke.settings = @s t_tt_scale
execute as @a[scores={t_tt_scale=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Масштаб времени Таймер-ТНТ установлен.","color":"yellow"}]
scoreboard players reset @a t_tt_scale
"""
    proc_content = proc_content.replace("execute as @a run function nuke:settings/enable_triggers", extra_proc + "\nexecute as @a run function nuke:settings/enable_triggers")
    with open(os.path.join(base_nuke, "function", "settings", "process_triggers.mcfunction"), "w", encoding="utf-8") as f:
        f.write(proc_content)

print("Chaos Update v8.0 build completed successfully!")
