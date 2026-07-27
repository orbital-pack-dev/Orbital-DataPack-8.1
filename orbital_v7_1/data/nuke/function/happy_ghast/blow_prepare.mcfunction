# Контекст: as <Гаст>, at @s. Готовим количество ТНТ для дропа.
execute store result storage nuke:ghast n int 1 run scoreboard players get @s ghast_tnt
function nuke:happy_ghast/blow with storage nuke:ghast
