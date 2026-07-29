# Одноразовый hard reset при /reload. Выполняется до тикового rebuild, поэтому
# можно строго удалить ВСЕ interaction в требуемом радиусе без ping-pong этажей.
kill @e[distance=..1.1,type=minecraft:interaction]
