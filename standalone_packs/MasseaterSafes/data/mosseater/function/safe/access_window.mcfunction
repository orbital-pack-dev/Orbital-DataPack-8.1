# Контекст: as <маркер>, at <центр блока>. Активное окно доступа.
# Пока окно открыто, НИ хитбокс, НИ vanilla lock не должны мешать ванильному
# GUI, иначе повторный ПКМ снова упрётся в один из барьеров.
scoreboard players remove @s mosseater.safe_data 1

# Радиус 0.8 покрывает собственный guard (максимум 0.54 у double chest) и не
# затрагивает guard соседнего сейфа на расстоянии 1 блока.
kill @e[tag=ms_safe_shield,distance=..0.8,type=minecraft:interaction]
execute align xyz run data remove block ~ ~ ~ components."minecraft:lock"

# Досрочное закрытие: игрок отошёл от сейфа. Запечатывание выполнит reseal
# в этом же тике, как только счётчик станет равен 0.
execute unless entity @a[distance=..4] run scoreboard players set @s mosseater.safe_data 0
