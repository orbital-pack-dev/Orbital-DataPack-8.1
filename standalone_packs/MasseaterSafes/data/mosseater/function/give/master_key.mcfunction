# МАСТЕР-КЛЮЧ. Админский предмет, открывает ЛЮБОЙ сейф без пароля.
#
# Функции по умолчанию требуют прав оператора (permission level 2), поэтому
# обычный игрок выдать себе мастер-ключ не может.
#
# Мастер-ключ намеренно НЕ имеет minecraft:custom_name: он проверяется только по
# custom_data и никогда не сравнивается с паролем, поэтому переименование в
# наковальне не превращает его в обычный ключ и не ломает логику.
give @s minecraft:tripwire_hook[minecraft:item_model="mosseater:safe_key_master",minecraft:custom_data={mosseater_master:1b},minecraft:enchantment_glint_override=true,minecraft:item_name={text:"Мастер-Ключ",color:"light_purple",bold:true,italic:false},minecraft:lore=[{text:"Открывает любой сейф",color:"gray",italic:false},{text:"Админский предмет",color:"dark_purple",italic:false},{text:"Не хранится внутри сейфов",color:"dark_gray",italic:false}]] 1
