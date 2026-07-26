# Активация Подрывного Жилета. Контекст: as <игрок>, at @s.
scoreboard players set @s bv_active 1

# Время до детонации: настройка, дефолт 640 тиков.
scoreboard players set @s bv_timer 640
execute if score bv_time nuke.settings matches 1.. run scoreboard players operation @s bv_timer = bv_time nuke.settings
execute if score nuke.cfg.bv_time nuke.settings matches 1.. run scoreboard players operation @s bv_timer = nuke.cfg.bv_time nuke.settings

playsound minecraft:entity.tnt.primed player @a[distance=..24] ~ ~ ~ 1 1
tellraw @s [{"text":"[ЖИЛЕТ] ","color":"red","bold":true},{"text":"Активирован. Снять его уже нельзя.","color":"gray","bold":false}]
