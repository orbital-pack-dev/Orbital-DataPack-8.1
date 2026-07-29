# Перед каждым summon: для изолированного сейфа полный hard-kill 1.1.
execute unless entity @e[tag=ms_safe_box,distance=0.8..1.1,limit=1,type=minecraft:marker] run kill @e[distance=..1.1,type=minecraft:interaction]
# Для double/вертикального склада чистится точная owner-point: иначе соседние
# сейфы удаляли бы друг друга и создавали бесконечный respawn loop.
function mosseater:safe/cleanup_interaction_center
