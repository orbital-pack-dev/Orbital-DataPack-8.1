# МОДУЛЬ 1 — Адаптивный центр партиклов.
# Контекст: as <маркер ms_safe_box>, at <центр блока сундука>.
#
# Вход через storage mosseater:safe fx:
#   fx.name  — id частицы без namespace (wax_off / happy_villager / smoke / ...)
#   fx.count — количество частиц (строка, чтобы макрос подставил её дословно)
#
# Одинарный сундук: визуальный центр совпадает с центром блока ~0.5 ~0.8 ~0.5.
# Double chest: геометрический центр общей крышки лежит РОВНО на грани между
# половинами, поэтому смещение по нужной оси становится 0.0 или 1.0 в
# зависимости от facing и type. Таблица направлений полностью совпадает с
# init_partner и sync_double, поэтому расхождений между логикой и визуалом нет.
data modify storage mosseater:safe fx.dx set value "0.5"
data modify storage mosseater:safe fx.dz set value "0.5"
execute unless data storage mosseater:safe fx.count run data modify storage mosseater:safe fx.count set value "7"
execute unless data storage mosseater:safe fx.name run data modify storage mosseater:safe fx.name set value "wax_off"

# --- minecraft:chest ---
execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] run data modify storage mosseater:safe fx.dx set value "1.0"
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] run data modify storage mosseater:safe fx.dx set value "0.0"
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] run data modify storage mosseater:safe fx.dx set value "0.0"
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] run data modify storage mosseater:safe fx.dx set value "1.0"
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] run data modify storage mosseater:safe fx.dz set value "1.0"
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] run data modify storage mosseater:safe fx.dz set value "0.0"
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] run data modify storage mosseater:safe fx.dz set value "0.0"
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] run data modify storage mosseater:safe fx.dz set value "1.0"

# --- minecraft:trapped_chest ---
execute if block ~ ~ ~ minecraft:trapped_chest[facing=north,type=left] run data modify storage mosseater:safe fx.dx set value "1.0"
execute if block ~ ~ ~ minecraft:trapped_chest[facing=north,type=right] run data modify storage mosseater:safe fx.dx set value "0.0"
execute if block ~ ~ ~ minecraft:trapped_chest[facing=south,type=left] run data modify storage mosseater:safe fx.dx set value "0.0"
execute if block ~ ~ ~ minecraft:trapped_chest[facing=south,type=right] run data modify storage mosseater:safe fx.dx set value "1.0"
execute if block ~ ~ ~ minecraft:trapped_chest[facing=east,type=left] run data modify storage mosseater:safe fx.dz set value "1.0"
execute if block ~ ~ ~ minecraft:trapped_chest[facing=east,type=right] run data modify storage mosseater:safe fx.dz set value "0.0"
execute if block ~ ~ ~ minecraft:trapped_chest[facing=west,type=left] run data modify storage mosseater:safe fx.dz set value "0.0"
execute if block ~ ~ ~ minecraft:trapped_chest[facing=west,type=right] run data modify storage mosseater:safe fx.dz set value "1.0"

function mosseater:safe/particle_fx_macro with storage mosseater:safe fx
data remove storage mosseater:safe fx
