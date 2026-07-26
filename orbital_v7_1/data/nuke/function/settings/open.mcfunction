execute unless entity @s[gamemode=creative] run tellraw @s ["",{"text":"⛔ ","color":"red"},{"text":"Настройки доступны только в креативе.","color":"gray"}]
execute unless entity @s[gamemode=creative] run return 0

function nuke:settings/enable_triggers
dialog show @s nuke:main