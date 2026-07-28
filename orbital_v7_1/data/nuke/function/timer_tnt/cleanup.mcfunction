# Remove every entity belonging to this charge without producing an item.
kill @e[type=minecraft:block_display,tag=tt_display,distance=..1.6]
kill @e[type=minecraft:text_display,tag=tt_text,distance=..1.6]
kill @e[type=minecraft:interaction,tag=tt_hitbox,distance=..1.6]
# Коллизия-магмакуб убирается через void, чтобы не оставить мелких кубов.
function nuke:timer_tnt/kill_wall
kill @s
