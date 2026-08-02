# Имя болванки после наковальни становится паролем сейфа.
#
# ПРЕДМЕТ: minecraft:echo_shard.
# Причина смены с tripwire_hook: крюк — БЛОК. Его можно было случайно
# поставить на землю, при этом предмет превращался в обычный блок мира и
# терял все компоненты (custom_name = пароль, custom_data, item_model).
# Эхо-осколок поставить нельзя в принципе, его не продаёт ни один житель,
# он не входит в снаряжение мобов и не используется в сундуках Vault.
#
# ВАЖНО: переименование в наковальне в Java доступно ЛЮБОМУ предмету,
# включая эхо-осколок, поэтому механика "имя ключа = пароль" сохраняется
# полностью и без изменений в UX.
#
# minecraft:item_model переопределяет модель ТОЛЬКО у этого конкретного
# предмета: обычный эхо-осколок остаётся с ванильной текстурой.
#
# minecraft:max_stack_size=1 — ключ никогда не собирается в стопку. Это
# защита от авто-крафтеров и от случайного шифт-клика стопкой ключей
# в верстак (см. advancement mosseater:guard_key_craft).
give @s minecraft:echo_shard[minecraft:item_model="mosseater:safe_key",minecraft:custom_data={mosseater_key_blank:1b},minecraft:max_stack_size=1,minecraft:item_name={text:"Болванка Ключа",color:"gray",bold:true,italic:false},minecraft:lore=[{text:"Переименуйте в наковальне",color:"dark_gray",italic:false},{text:"Имя ключа = пароль сейфа",color:"gray",italic:false},{text:"Совет: добавляйте буквы, а не только цифры",color:"yellow",italic:false},{text:"Пример: Safe777 или Дом-42",color:"dark_gray",italic:false}]] 1
