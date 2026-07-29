# Сравнение имени ключа и пароля сейфа.
#
# ROOT CAUSE FIX (чисто цифровой пароль).
# Прежняя версия использовала макрос и подставляла сырую строку в предикат:
#   minecraft:custom_name=$(password)
# Для имени "Alpha" это случайно работало, потому что SNBT допускает
# неквотированную строку. Для имени "1234" значение разбиралось как ЦЕЛОЕ ЧИСЛО,
# а не как text component, поэтому предикат НИКОГДА не совпадал и чисто
# цифровой пароль всегда отклонялся.
#
# Теперь сравнение идёт как NBT-равенство через storage. Строка никогда не
# попадает в текст команды, поэтому корректно работают цифры, буквы, кириллица,
# пробелы и любые символы.
data modify storage mosseater:safe key.held set from entity @a[tag=ms_safe_user,limit=1] SelectedItem.components."minecraft:custom_name"
data modify storage mosseater:safe key.compare set from storage mosseater:safe key.password

# data modify возвращает success=0, если значение не изменилось.
# Значит 0 == имена идентичны, 1 == ключ не тот.
execute store success score #key_match mosseater.safe_config run data modify storage mosseater:safe key.compare set from storage mosseater:safe key.held

execute if score #key_match mosseater.safe_config matches 0 run return run function mosseater:safe/access_granted
function mosseater:safe/access_denied
