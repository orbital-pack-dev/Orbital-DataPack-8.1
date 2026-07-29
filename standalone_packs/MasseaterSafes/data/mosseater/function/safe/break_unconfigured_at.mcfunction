# Контекст position: новый приставленный сундук.
kill @e[distance=..1.1,type=minecraft:interaction]
kill @e[tag=ms_safe_box,distance=..0.7,type=minecraft:marker]
setblock ~ ~ ~ minecraft:air destroy
title @a[tag=ms_safe_merge_user,limit=1] actionbar {text:"Нельзя расширять сейф до завершения установки пароля!",color:"red",bold:true}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_merge_user,limit=1] ~ ~ ~ 1 0.7
