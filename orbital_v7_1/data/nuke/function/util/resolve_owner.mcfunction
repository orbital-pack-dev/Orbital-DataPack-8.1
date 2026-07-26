# @s = носитель заряда (block_display / гаст / любая сущность со score nuke.pid).
# Помечает владельца тегом nuke_attacker, чтобы использовать его в "damage ... by".
tag @a remove nuke_attacker
execute if score @s nuke.pid matches 1.. run tag @s add nuke_pid_src
execute as @a if score @s nuke.pid = @e[tag=nuke_pid_src,limit=1] nuke.pid run tag @s add nuke_attacker
tag @s remove nuke_pid_src
