# Контекст: as/at кликнутый guard interaction.
execute unless entity @e[tag=ms_safe_pair,type=minecraft:marker] run function mosseater:safe/select_pair

title @a[tag=ms_safe_user,limit=1] actionbar {text:"Неверный ключ сейфа",color:"red",bold:true}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.9 0.55

data modify storage mosseater:safe fx.name set value "smoke"
data modify storage mosseater:safe fx.count set value "12"
execute as @e[tag=ms_safe_pair,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx

function mosseater:safe/clear_pair
