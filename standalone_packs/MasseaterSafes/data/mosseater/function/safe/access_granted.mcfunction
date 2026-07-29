# Контекст: as/at кликнутая interaction.
# Обе половины получают единое трёхсекундное окно доступа.
scoreboard players set @e[tag=ms_safe_box,distance=..0.75,type=minecraft:marker] mosseater.safe_data 60
playsound minecraft:block.iron_door.open master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.8 1.35
execute at @e[tag=ms_safe_box,distance=..0.75,sort=nearest,limit=1,type=minecraft:marker] align xyz run particle minecraft:wax_off ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.02 7 normal @a[distance=..32]

# Удаление выполняется от ближайшего marker сейфа, а не от позиции игрока.
# Радиус 1.5 гарантированно покрывает single и общий hitbox double chest.
execute at @e[tag=ms_safe_box,distance=..1.5,sort=nearest,limit=1,type=minecraft:marker] run kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]
# Fallback для кликнутого executor, если marker был повреждён или отсутствовал.
kill @s
