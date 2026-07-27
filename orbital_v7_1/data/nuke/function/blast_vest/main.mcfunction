# ВЗРЫВНОЙ ЖИЛЕТ — тиковая логика. Контекст: as <игрок в жилете>, at @s.
# Вызывается из nuke:tick ТОЛЬКО по прямой проверке компонента в слоте нагрудника:
#   execute as @a if items entity @s armor.chest *[custom_data~{blast_vest:1b}] at @s run ...

# Первый тик в жилете — активация таймера.
execute unless score @s bv_active matches 1 run function nuke:blast_vest/init
scoreboard players remove @s bv_timer 1

# Секунды до подрыва — в actionbar.
scoreboard players operation @s nuke.temp = @s bv_timer
scoreboard players operation @s nuke.temp /= #20 nuke.settings
title @s actionbar [{"text":"⚠ ПОДРЫВ ЧЕРЕЗ: ","color":"red","bold":true},{"score":{"name":"@s","objective":"nuke.temp"},"color":"gold","bold":true},{"text":" сек","color":"red","bold":true}]

# Раз в секунду — тиканье нотного блока и дым, строго в координатах игрока.
scoreboard players operation @s bv_mod = @s bv_timer
scoreboard players operation @s bv_mod %= #20 nuke.settings
execute if score @s bv_mod matches 0 run playsound minecraft:block.note_block.hat master @a[distance=..16] ~ ~ ~ 1 1
execute if score @s bv_mod matches 0 run particle minecraft:smoke ~ ~1 ~ 0.35 0.45 0.35 0.02 8 force

# Досрочный подрыв по Shift — строго через системный предикат скрытности.
execute if entity @s[predicate=nuke:is_sneaking] run return run function nuke:blast_vest/detonate
# Подрыв по обнулению таймера.
execute if score @s bv_timer matches ..0 run function nuke:blast_vest/detonate
