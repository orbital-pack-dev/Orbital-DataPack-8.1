# Выполняется один раз при превращении незавершённого single в double.
execute if entity @s[tag=ms_safe_merge_warned] run return 0
tag @s add ms_safe_merge_warned
title @p[distance=..6] actionbar {text:"Создайте пароль перед тем, как ставить блоки рядом!",color:"red",bold:true}
kill @e[tag=ms_safe_setup,distance=..1.2,type=minecraft:interaction]
function mosseater:safe/place_setup
