# Контекст: as <игрок>, positioned <центр блока сундука, низ>.

# Приводим блок к одиночному сундуку: двойной сундук позволял бы открыть
# защищённую половину через незапертую соседнюю.
setblock ~ ~ ~ minecraft:chest[type=single] keep

# Интеракция-маркер нужна ТОЛЬКО на этапе настройки.
# Ставим её ровно в ~ ~ ~ (не ~-0.1), иначе data modify block ~ ~ ~ из
# контекста этой сущности попадал бы в блок НИЖЕ сундука.
summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_setup"],width:1.0f,height:1.0f,response:true}

# Диалог показываем инициатору по тегу, а не @p от позиции блока.
dialog show @a[tag=safe_user,limit=1] nuke:safe_setup
