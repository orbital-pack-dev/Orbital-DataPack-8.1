# Обезвреживание Таймер-ТНТ
playsound minecraft:entity.generic.extinguish_fire master @a ~ ~ ~ 2 1.0
particle cloud ~ ~0.5 ~ 0.5 0.5 0.5 0.05 20
kill @e[type=text_display,tag=tt_text,distance=..3,limit=1]
kill @s
