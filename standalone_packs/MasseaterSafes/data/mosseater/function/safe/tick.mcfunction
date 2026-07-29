# ПКМ по interaction записывает compound interaction и relation target.
# Обрабатываем клик до marker tick; отрицательная ветка обязательно очищает NBT.
execute as @e[tag=ms_safe_shield,nbt={interaction:{}},type=minecraft:interaction] at @s run function mosseater:safe/on_interact

# Каждый блок-половина имеет собственный marker состояния.
execute as @e[tag=ms_safe_box,type=minecraft:marker] at @s run function mosseater:safe/tick_one
