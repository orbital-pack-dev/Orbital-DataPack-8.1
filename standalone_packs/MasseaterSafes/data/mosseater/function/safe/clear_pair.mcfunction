# Тег ms_safe_pair живёт строго внутри одного вызова и снимается со всех
# маркеров, чтобы следующий клик начинал выборку с чистого состояния.
tag @e[tag=ms_safe_pair,type=minecraft:marker] remove ms_safe_pair
