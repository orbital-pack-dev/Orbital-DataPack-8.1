# Макро-функция. Контекст: at <блок сундука>. Аргумент: storage nuke:safe key -> pw
#
# В 1.21.2+ компонент minecraft:lock — это ITEM PREDICATE, а не строка.
# Помимо имени требуем tripwire_hook с custom_data {nuke_key_active:true}:
# так простой переименованный предмет (или подменённые компоненты) не подойдёт.
$data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",components:{"minecraft:custom_name":'$(pw)'},predicates:{"minecraft:custom_data":{nuke_key_active:true}}}
