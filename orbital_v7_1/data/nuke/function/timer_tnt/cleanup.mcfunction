# Remove every entity belonging to this charge without producing an item.
kill @e[type=minecraft:block_display,tag=tt_display,distance=..1.6]
kill @e[type=minecraft:text_display,tag=tt_text,distance=..1.6]
kill @e[type=minecraft:interaction,tag=tt_hitbox,distance=..1.6]
# ЗАДАЧА 2.1: слайм-коллизия убирается вместе с зарядом (и при разрядке водой).
kill @e[type=minecraft:slime,tag=timer_tnt_slime,distance=..1.6]
kill @s
