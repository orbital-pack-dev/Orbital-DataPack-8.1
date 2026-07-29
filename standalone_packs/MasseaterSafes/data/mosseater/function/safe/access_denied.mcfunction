title @a[tag=ms_safe_user,limit=1] actionbar {text:"Неверный ключ сейфа",color:"red",bold:true}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.9 0.55
data modify storage mosseater:safe fx set value {id:"minecraft:smoke",speed:0.025,count:12}
execute as @e[tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] at @s run function mosseater:safe/particle_fx with storage mosseater:safe fx
data remove storage mosseater:safe fx
