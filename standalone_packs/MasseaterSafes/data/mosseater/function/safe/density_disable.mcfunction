# Плотный склад: замки остаются, отключаются только guard interaction.
# 2400 тиков = 2 минуты после последнего обнаружения высокой плотности.
scoreboard players set @e[tag=ms_safe_box,tag=ms_safe_configured,distance=..1.8,type=minecraft:marker] mosseater.safe_data 2400
execute as @e[tag=ms_safe_box,tag=ms_safe_configured,distance=..1.8,type=minecraft:marker] at @s run kill @e[tag=ms_safe_guard,distance=..0.8,type=minecraft:interaction]
