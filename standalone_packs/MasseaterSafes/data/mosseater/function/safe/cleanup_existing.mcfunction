# Изолированная конструкция: требуемая жёсткая очистка полного радиуса 1.1.
# В плотном вертикальном складе broad-kill запрещён, чтобы соседние этажи
# не удаляли interaction друг друга; там чистится только точный центр владельца.
execute unless entity @e[tag=ms_safe_box,distance=0.8..1.1,limit=1,type=minecraft:marker] run kill @e[distance=..1.1,type=minecraft:interaction]
function mosseater:safe/cleanup_interaction_center
