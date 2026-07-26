# Отображение обратного отсчёта. Контекст: as <игрок>, at @s.
# Никаких изменений таймера здесь быть НЕ ДОЛЖНО.
scoreboard players set #20 nuke.settings 20
scoreboard players operation #bv_sec nuke.settings = @s bv_timer
scoreboard players operation #bv_sec nuke.settings /= #20 nuke.settings

title @s actionbar [{"text":"ЖИЛЕТ: ","color":"red","bold":true},{"score":{"name":"#bv_sec","objective":"nuke.settings"},"color":"yellow","bold":true},{"text":" сек","color":"red","bold":false}]
particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.4 0.3 2 0.01
