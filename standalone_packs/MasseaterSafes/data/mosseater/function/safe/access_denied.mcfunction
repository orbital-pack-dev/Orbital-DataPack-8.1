title @a[tag=ms_safe_user,limit=1] actionbar {text:"Неверный ключ сейфа",color:"red",bold:true}
playsound minecraft:block.chest.locked master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.9 0.55
execute at @e[type=minecraft:marker,tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1] align xyz run particle minecraft:smoke ~0.5 ~0.5 ~0.5 0.3 0.3 0.3 0.025 12 normal @a[distance=..32]
