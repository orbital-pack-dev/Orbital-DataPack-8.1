# Имя болванки после наковальни становится паролем сейфа.
#
# minecraft:item_model переопределяет модель ТОЛЬКО у этого конкретного предмета.
# Обычный tripwire_hook без этого компонента остаётся с ванильной текстурой.
# В 1.21.11 числовой custom_model_data больше не нужен: модель адресуется
# по id из assets/mosseater/items/safe_key.json.
give @s minecraft:tripwire_hook[minecraft:item_model="mosseater:safe_key",minecraft:custom_data={mosseater_key_blank:1b},minecraft:item_name={text:"Болванка Ключа",color:"gray",bold:true,italic:false},minecraft:lore=[{text:"Переименуйте в наковальне",color:"dark_gray",italic:false},{text:"Имя ключа = пароль сейфа",color:"gray",italic:false},{text:"Совет: добавляйте буквы, а не только цифры",color:"yellow",italic:false},{text:"Пример: Safe777 или Дом-42",color:"dark_gray",italic:false}]] 1
