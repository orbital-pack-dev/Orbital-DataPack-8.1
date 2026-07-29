# Контекст: as/at marker сейфа.
# apply_marker_lock выравнивает координаты и атомарно возвращает lock в блок.
function mosseater:safe/apply_marker_lock

# После восстановления vanilla lock защитный hitbox получает 60 тиков rearm.
scoreboard players set @s mosseater.safe_data 60
kill @e[tag=ms_safe_shield,distance=..1.5,type=minecraft:interaction]
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 0.8 1.0
execute align xyz run particle minecraft:smoke ~0.5 ~0.8 ~0.5 0.25 0.2 0.25 0.01 5 normal @a[distance=..32]
