# Контекст: as <сущность-носитель заряда>, у которой в nuke.pid лежит id владельца.
# Помечает владельца тегом nuke_attacker. После нанесения урона тег ОБЯЗАТЕЛЬНО снять.
tag @a remove nuke_attacker
execute if score @s nuke.pid matches 1.. run tag @s add nuke_pid_src
execute if entity @e[tag=nuke_pid_src,limit=1] as @a if score @s nuke.pid = @e[tag=nuke_pid_src,limit=1] nuke.pid run tag @s add nuke_attacker
tag @s remove nuke_pid_src
