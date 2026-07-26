import os
import json

base_dir = r"c:\Users\1\AppData\Roaming\ModrinthApp\profiles\Cozy Modpack by remkkic\saves\Nuke-проверка\datapacks\orbital_v7_1\data\nuke"

def write_json(subpath, data):
    path = os.path.join(base_dir, subpath)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

def write_mc(subpath, text):
    path = os.path.join(base_dir, subpath)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(text.strip() + "\n")

# 1. Give functions
write_mc("function/give/safe_chest.mcfunction", """
give @s chest[minecraft:item_name='{"text":"Защищённый Сундук","color":"gold","bold":true}',minecraft:custom_data={safe_box:true},minecraft:lore=['{"text":"Позволяет установить ПИН-код или Пароль","color":"gray"}']] 1
""")

write_mc("function/give/safe_key_blank.mcfunction", """
give @s tripwire_hook[minecraft:item_name='{"text":"Болванка Ключа","color":"gray"}',minecraft:custom_data={nuke_key_blank:true},minecraft:lore=['{"text":"Переименуйте в Наковальне и примените на сундук","color":"dark_gray"}']] 1
""")

# 2. Advancements
write_json("advancement/safe_placed.json", {
  "criteria": {
    "placed": {
      "trigger": "minecraft:placed_block",
      "conditions": {
        "item": {
          "items": "minecraft:chest",
          "predicates": {
            "minecraft:custom_data": {
              "safe_box": True
            }
          }
        }
      }
    }
  },
  "rewards": {
    "function": "nuke:safe/placed"
  }
})

write_json("advancement/safe_interact.json", {
  "criteria": {
    "interacted": {
      "trigger": "minecraft:player_interacted_with_entity",
      "conditions": {
        "entity": {
          "type": "minecraft:interaction",
          "tags": ["safe_shield"]
        }
      }
    }
  },
  "rewards": {
    "function": "nuke:safe/interact"
  }
})

write_json("advancement/safe_hurt.json", {
  "criteria": {
    "hurt": {
      "trigger": "minecraft:player_hurt_entity",
      "conditions": {
        "entity": {
          "type": "minecraft:interaction",
          "tags": ["safe_shield"]
        }
      }
    }
  },
  "rewards": {
    "function": "nuke:safe/hurt"
  }
})

# 3. Item modifier
write_json("item_modifier/make_key_active.json", {
  "function": "minecraft:set_custom_data",
  "custom_data": {
    "nuke_key_blank": False,
    "nuke_key_active": True
  }
})

# 4. Safe Setup Dialog
write_json("dialog/safe_setup.json", {
  "type": "minecraft:multi_action",
  "title": {"text":"🔒 НАСТРОЙКА СУНДУКА","color":"gold","bold":True},
  "body": {"type":"minecraft:plain_message","contents":{"text":"Этот сундук пока не защищён. Создать ключ-пароль?","color":"gray"}},
  "columns": 2,
  "can_close_with_escape": True,
  "actions": [
    {
      "label": {"text":"🔑 Создать Ключ","color":"#55ff55"},
      "action": {"type":"minecraft:run_command","command":"/trigger t_safe_key"}
    },
    {
      "label": {"text":"❌ Оставить открытым","color":"#ff5555"},
      "action": {"type":"minecraft:run_command","command":"/trigger t_safe_cancel"}
    }
  ]
})

# 5. Functions
write_mc("function/safe/placed.mcfunction", """
advancement revoke @s only nuke:safe_placed
execute anchored eyes positioned ^ ^ ^ run function nuke:safe/raycast_loop
""")

write_mc("function/safe/raycast_loop.mcfunction", """
execute if block ~ ~ ~ chest unless entity @e[type=interaction,tag=safe_shield,distance=..1] run function nuke:safe/found
execute unless block ~ ~ ~ chest positioned ^ ^ ^0.2 if entity @s[distance=..6] run function nuke:safe/raycast_loop
""")

write_mc("function/safe/found.mcfunction", """
align xyz positioned ~0.5 ~ ~0.5 run function nuke:safe/init_shield
""")

write_mc("function/safe/init_shield.mcfunction", """
# Convert block to single chest if it connected
setblock ~ ~ ~ chest[type=single] keep
# Summon the interaction entity
summon interaction ~ ~ ~ {Tags:["safe_shield", "safe_setup"], width:1.01f, height:1.01f, response:1b}
# Ask the player to set it up
dialog show @p nuke:safe_setup
""")

write_mc("function/safe/process_setup.mcfunction", """
execute as @a[scores={t_safe_key=1..}] run function nuke:safe/setup_key
execute as @a[scores={t_safe_cancel=1..}] run function nuke:safe/setup_cancel
scoreboard players reset * t_safe_key
scoreboard players reset * t_safe_cancel
""")

write_mc("function/safe/setup_key.mcfunction", """
function nuke:give/safe_key_blank
title @s actionbar {"text":"Переименуйте болванку в Наковальне и кликните по сундуку!","color":"yellow"}
playsound minecraft:block.anvil.use master @s ~ ~ ~ 1 1
execute as @e[type=interaction,tag=safe_setup,distance=..6,sort=nearest,limit=1] run tag @s remove safe_setup
execute as @e[type=interaction,tag=safe_shield,distance=..6,sort=nearest,limit=1] run tag @s add safe_awaiting_key
""")

write_mc("function/safe/setup_cancel.mcfunction", """
title @s actionbar {"text":"Сундук оставлен открытым.","color":"gray"}
execute as @e[type=interaction,tag=safe_setup,distance=..6,sort=nearest,limit=1] run kill @s
""")

write_mc("function/safe/interact.mcfunction", """
advancement revoke @s only nuke:safe_interact
execute as @e[type=interaction,tag=safe_shield,distance=..6,sort=nearest,limit=1] run function nuke:safe/interact_entity
""")

write_mc("function/safe/interact_entity.mcfunction", """
execute if entity @s[tag=safe_awaiting_key] run function nuke:safe/set_password
execute if entity @s[tag=safe_locked] run function nuke:safe/try_open
""")

write_mc("function/safe/set_password.mcfunction", """
# Check if player holds a blank key
execute if items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_blank:true}] run function nuke:safe/set_password_success
execute unless items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_blank:true}] run title @p actionbar {"text":"Возьмите переименованную Болванку Ключа в руку!","color":"red"}
""")

write_mc("function/safe/set_password_success.mcfunction", """
data modify entity @s data.password set from entity @p SelectedItem.components."minecraft:custom_name"
item modify entity @p weapon.mainhand nuke:make_key_active
function nuke:safe/lock_chest_macro with entity @s data
tag @s remove safe_awaiting_key
tag @s add safe_locked
title @p actionbar {"text":"Пароль установлен! Сундук надёжно заперт.","color":"green"}
playsound minecraft:block.chest.locked master @p ~ ~ ~ 1 1
""")

write_mc("function/safe/lock_chest_macro.mcfunction", """
$data modify block ~ ~ ~ components."minecraft:lock" set value "$(password)"
""")

write_mc("function/safe/try_open.mcfunction", """
execute if items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_active:true}] run function nuke:safe/verify_key_macro with entity @s data
execute unless items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_active:true}] run title @p actionbar {"text":"Нужен Ключ для открытия!","color":"red"}
execute unless items entity @p weapon.mainhand tripwire_hook[custom_data~{nuke_key_active:true}] run playsound minecraft:block.chest.locked master @p ~ ~ ~ 1 1
""")

write_mc("function/safe/verify_key_macro.mcfunction", """
$execute if items entity @p weapon.mainhand tripwire_hook[custom_name='$(password)'] run function nuke:safe/unlock_temporarily
$execute unless items entity @p weapon.mainhand tripwire_hook[custom_name='$(password)'] run title @p actionbar {"text":"Неверный пароль ключа!","color":"dark_red"}
""")

write_mc("function/safe/unlock_temporarily.mcfunction", """
data modify entity @s width set value 0.0f
data modify entity @s height set value 0.0f
schedule function nuke:safe/restore_hitbox 10t append
title @p actionbar {"text":"Ключ принят!","color":"green"}
playsound minecraft:block.iron_door.open master @p ~ ~ ~ 1 2
""")

write_mc("function/safe/hurt.mcfunction", """
advancement revoke @s only nuke:safe_hurt
execute as @e[type=interaction,tag=safe_shield,distance=..6,sort=nearest,limit=1] run function nuke:safe/interact_entity
""")

write_mc("function/safe/restore_hitbox.mcfunction", """
data modify entity @s width set value 1.01f
data modify entity @s height set value 1.01f
""")

print("Generated safe chest files successfully.")
