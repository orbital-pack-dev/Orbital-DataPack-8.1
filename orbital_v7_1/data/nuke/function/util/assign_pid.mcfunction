# Выдаёт игроку (@s) стабильный числовой идентификатор владельца.
# Нужен, чтобы взрывы/удары засчитывались конкретному игроку без макросов и UUID.
execute unless score @s nuke.pid matches 1.. run scoreboard players add #pid_seq nuke.settings 1
execute unless score @s nuke.pid matches 1.. run scoreboard players operation @s nuke.pid = #pid_seq nuke.settings
