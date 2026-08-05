# Отображение отсчёта. Контекст: as <игрок в жилете>, at @s.

# Секунды = тики / 20.
scoreboard players operation @s nuke.temp = @s bv_timer
scoreboard players operation @s nuke.temp /= #20 nuke.settings

title @s actionbar ["",{"text":"ПОДРЫВНОЙ ЖИЛЕТ: ","color":"red","bold":true},{"score":{"name":"@s","objective":"nuke.temp"},"color":"yellow","bold":true},{"text":" сек","color":"red","bold":true}]

# Частицы задержки — каждый тик.
particle minecraft:smoke ~ ~1 ~ 0.3 0.4 0.3 0.01 3
execute if score @s bv_timer matches ..100 run particle minecraft:flame ~ ~1 ~ 0.3 0.4 0.3 0.01 4
execute if score @s bv_timer matches ..100 run particle minecraft:lava ~ ~1 ~ 0.2 0.3 0.2 0.01 1

# Звук тиканья — ровно раз в секунду (остаток от деления на 20).
scoreboard players operation @s tt_mod = @s bv_timer
scoreboard players operation @s tt_mod %= #20 nuke.settings
execute if score @s tt_mod matches 0 run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.6
execute if score @s tt_mod matches 0 if score @s bv_timer matches ..100 run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 1 2
execute if score @s tt_mod matches 10 if score @s bv_timer matches ..100 run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 1 2
