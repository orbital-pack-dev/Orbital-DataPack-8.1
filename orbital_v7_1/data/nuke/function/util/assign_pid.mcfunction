# Контекст: as <игрок>.
# Выдаёт игроку постоянный числовой идентификатор владельца (nuke.pid).
# Нужен, чтобы снаряд/заряд датапака мог позже найти своего хозяина и
# нанести урон ОТ ЕГО ИМЕНИ (damage ... by <игрок>). Имена и UUID в
# ванильных командах получить нельзя, поэтому используется счётчик.
execute unless score @s nuke.pid matches 1.. run scoreboard players add #pid_seq nuke.settings 1
execute unless score @s nuke.pid matches 1.. run scoreboard players operation @s nuke.pid = #pid_seq nuke.settings
