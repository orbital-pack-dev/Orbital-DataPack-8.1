# ПОДРЫВНОЙ ЖИЛЕТ — тик. Контекст: as <игрок в жилете>, at @s.

# 1) САМОВЗВОД: жилет надет, но таймер не активен — активируем немедленно.
# Больше никакой зависимости от достижений/триггеров одевания — именно она ломала таймер.
execute unless score @s bv_active matches 1 run function nuke:blast_vest/init

# 2) Единственный в проекте декремент таймера.
scoreboard players remove @s bv_timer 1

# 3) Визуал, звук и actionbar — на владельца жилета.
function nuke:blast_vest/display

# 4) Шифт — досрочный подрыв.
execute if entity @s[predicate=nuke:is_sneaking] run return run function nuke:blast_vest/detonate

# 5) Время вышло.
execute if score @s bv_timer matches ..0 run function nuke:blast_vest/detonate
