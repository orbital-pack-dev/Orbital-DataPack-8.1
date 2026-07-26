# Убираем лишний сундук с возвратом предмета и содержимого игроку через дроп.
# Как только соседний блок исчезает, сейф автоматически снова становится type=single.
setblock ~ ~ ~ minecraft:air destroy
playsound minecraft:block.chest.locked block @s ~ ~ ~ 1 1
tellraw @s [{"text":"[СЕЙФ] ","color":"gold","bold":true},{"text":"Нельзя объединять сундук с запертым сейфом.","color":"red","bold":false}]
