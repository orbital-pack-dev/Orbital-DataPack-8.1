# Контекст: as <игрок>, positioned <центр блока сундука, низ>.

# Приводим блок к ОДИНОЧНОМУ сундуку.
# Раньше здесь стоял `setblock ~ ~ ~ minecraft:chest[type=single] keep`, но `keep`
# применяется ТОЛЬКО к воздуху — на уже стоящем сундуке команда не делала ничего,
# поэтому объединение в двойной сундук оставалось возможным.
# Теперь состояние переписывается принудительно с сохранением ориентации.
execute if block ~ ~ ~ minecraft:chest[facing=north] run setblock ~ ~ ~ minecraft:chest[type=single,facing=north] replace
execute if block ~ ~ ~ minecraft:chest[facing=south] run setblock ~ ~ ~ minecraft:chest[type=single,facing=south] replace
execute if block ~ ~ ~ minecraft:chest[facing=east] run setblock ~ ~ ~ minecraft:chest[type=single,facing=east] replace
execute if block ~ ~ ~ minecraft:chest[facing=west] run setblock ~ ~ ~ minecraft:chest[type=single,facing=west] replace

# Интеракция-маркер нужна ТОЛЬКО на этапе настройки.
# Ставим её ровно в ~ ~ ~ (не ~-0.1), иначе data modify block ~ ~ ~ из
# контекста этой сущности попадал бы в блок НИЖЕ сундука.
summon minecraft:interaction ~ ~ ~ {Tags:["safe_shield","safe_setup"],width:1.0f,height:1.0f,response:true}

# Диалог показываем инициатору по тегу, а не @p от позиции блока.
dialog show @a[tag=safe_user,limit=1] nuke:safe_setup
