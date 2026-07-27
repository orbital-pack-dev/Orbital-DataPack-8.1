# Активация жилета. Контекст: as <игрок>, at @s.
scoreboard players set @s bv_active 1
# Базовый таймер: 32 секунды (640 тиков), как заявлено в лоре предмета. Админ-настройка t_bv_time может переопределить.
scoreboard players set @s bv_timer 640
execute if score nuke.cfg.bv_time nuke.settings matches 1.. run scoreboard players operation @s bv_timer = nuke.cfg.bv_time nuke.settings
scoreboard players set @s bv_mod 0
tag @s add bv_owner
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
particle minecraft:flame ~ ~1 ~ 0.3 0.4 0.3 0.02 12 force
tellraw @s [{"text":"[ЖИЛЕТ] ","color":"red","bold":true},{"text":"Таймер активирован: 32 секунды. Shift — досрочный подрыв.","color":"gold"}]
