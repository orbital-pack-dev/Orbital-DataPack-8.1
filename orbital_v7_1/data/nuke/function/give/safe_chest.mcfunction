# item_name (а не custom_name) — чтобы имя не считалось пользовательским
# переименованием и совпадало с рецептом. custom_data — булево true (1b),
# ровно как в предикате advancement nuke:safe_placed.
give @s minecraft:chest[minecraft:custom_data={safe_box:true},minecraft:item_name={"text":"📦 Сундук с Паролем","color":"gold","bold":true,"italic":false},minecraft:lore=[{"text":"Поставьте, чтобы установить пароль","color":"gray","italic":false}]] 1
